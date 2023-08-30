// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0;
pragma abicoder v2;

import { StdCheats } from "forge-std/StdCheats.sol";
import { console2 } from "forge-std/console2.sol";

import { IUniswapV3Factory } from "@uniswap/v3-core/contracts/interfaces/IUniswapV3Factory.sol";
import { IUniswapV3Pool } from "@uniswap/v3-core/contracts/interfaces/IUniswapV3Pool.sol";
import { FixedPoint96 } from "@uniswap/v3-core/contracts/libraries/FixedPoint96.sol";

import { INonfungibleTokenPositionDescriptor } from "@uniswap/v3-periphery/contracts/interfaces/INonfungibleTokenPositionDescriptor.sol";
import { INonfungiblePositionManager } from "@uniswap/v3-periphery/contracts/interfaces/INonfungiblePositionManager.sol";
import { ISwapRouter } from "@uniswap/v3-periphery/contracts/interfaces/ISwapRouter.sol";

import { IUniswapV3Staker } from "@uniswap/v3-staker/contracts/interfaces/IUniswapV3Staker.sol";

import { MockERC20 } from "./mock/MockERC20.sol";

import { Precompiles } from "./utils/Precompiles.sol";

import { IFoo } from "../src/interfaces/IFoo.sol";

contract UniswapTest is StdCheats {

    // Uniswap V3 contracts
    IUniswapV3Factory internal uniswapV3Factory;
    INonfungibleTokenPositionDescriptor internal nonfungibleTokenPositionDescriptor;
    INonfungiblePositionManager internal nonfungiblePositionManager;
    ISwapRouter internal swapRouter;
    IUniswapV3Staker internal v3Staker;

    MockERC20 tokenA;
    MockERC20 tokenB;

    address internal alice = address(1);

    // TOO Big precompile?? maybe try read the bytecode from a file?
    Precompiles internal precompiles;

    uint256 constant internal MAX_UINT256 = type(uint256).max;

    IFoo internal foo;

    function setUp() public virtual {

        foo = IFoo(deployCode("Foo.sol"));
        require(foo.id(100) == 100, "invalid foo id");

        precompiles = new Precompiles();

        tokenA = new MockERC20("Token A", "TA", MAX_UINT256);
        tokenB = new MockERC20("Token B", "TB", MAX_UINT256);

        address wethAddress = address(1);
        // do not deploy the UniswapV3Factory directly, but instead use the UniswapV3Factory@0.8 bytecode(which contains the UniswapV3Pool@0.8 bytecode) so to be consistent with the PoolAddress#POOL_INIT_CODE_HASH in v3-periphery@0.8
        // uniswapV3Factory = IUniswapV3Factory(deployCode("UniswapV3Factory.sol"));
        uniswapV3Factory = precompiles.deployUniswapV3Factory();

        // cannot deploy this contract as there's no way to programmatically link the NFTDescriptor library which the NonfungibleTokenPositionDescriptor requires
        // however NonfungibleTokenPositionDescriptor is not really needed for the core functionality of NonfungiblePositionManager
        // nonfungibleTokenPositionDescriptor = INonfungibleTokenPositionDescriptor(deployCode("NonfungibleTokenPositionDescriptor.sol", abi.encode(wethAddress, "ETH")));

        nonfungiblePositionManager = INonfungiblePositionManager(deployCode("NonfungiblePositionManager.sol", abi.encode(address(uniswapV3Factory), wethAddress, address(nonfungibleTokenPositionDescriptor))));
        swapRouter = ISwapRouter(deployCode("SwapRouter.sol", abi.encode(address(uniswapV3Factory), wethAddress)));

        uint256 _maxIncentiveStartLeadTime = 86_400; // incentive start time must be at most within a day of creation
        uint256 _maxIncentiveDuration = 86_400 * 30; // incentive duration from start to end can be at most 30 days

        v3Staker = IUniswapV3Staker(deployCode("UniswapV3Staker.sol", abi.encode(address(uniswapV3Factory), address(nonfungiblePositionManager), _maxIncentiveStartLeadTime, _maxIncentiveDuration)));

        require(v3Staker.factory() == uniswapV3Factory, "factory ne");
    }

    function test_Uniswap() external {
        address _tokenA = address(tokenA);
        address _tokenB = address(tokenB);
        uint24 fee = 500;

        address actualPool = uniswapV3Factory.createPool(_tokenA, _tokenB, fee);
        address pool = uniswapV3Factory.getPool(_tokenA, _tokenB, fee);

        require(pool != address(0), "pool must neq address(0)");
        require(pool == actualPool, "actual must eq expected pool");

        console2.log("pool:", address(pool));

        IUniswapV3Pool v3Pool = IUniswapV3Pool(actualPool);

        v3Pool.initialize(uint160(FixedPoint96.Q96));

        tokenA.approve(address(nonfungiblePositionManager), MAX_UINT256);
        tokenB.approve(address(nonfungiblePositionManager), MAX_UINT256);

        (address token0, address token1) = _tokenA < _tokenB ? (_tokenA, _tokenB) : (_tokenB, _tokenA);

        INonfungiblePositionManager.MintParams memory mintParams = INonfungiblePositionManager.MintParams({
            token0: token0,
            token1: token1,
            fee: fee,
            tickLower:-100,
            tickUpper:100,
            amount0Desired: 1e18,
            amount1Desired: 1e18,
            amount0Min: 0,
            amount1Min: 0,
            recipient: alice,
            deadline: MAX_UINT256
        });

        nonfungiblePositionManager.mint(mintParams);
    }
}
