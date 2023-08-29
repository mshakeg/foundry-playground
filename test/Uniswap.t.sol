// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0;

// If I try to compile using "pragma solidity >=0.8.19 <0.9.0;" I get the following compile error, hence why I am using "pragma solidity >=0.8.0;" instead.
// Encountered invalid solc version in test/Uniswap.t.sol: Failed to parse solidity version >=0.8.19 <0.9.0: expected comma after patch version number, found '<'

// However even after adjusting the solidity version as above described I still get the following compile error:
// Discovered incompatible solidity versions in following
// : test/Uniswap.t.sol (>=0.8.0) imports:
//     lib/v3-core/contracts/UniswapV3Factory.sol (=0.8.12)
//     lib/v3-core/contracts/interfaces/IUniswapV3Pool.sol (>=0.5.0)
//     lib/v3-periphery/contracts/NonfungibleTokenPositionDescriptor.sol (=0.8.15)
//     lib/v3-periphery/contracts/NonfungiblePositionManager.sol (=0.8.15)
//     lib/v3-periphery/contracts/SwapRouter.sol (=0.8.15)
//     lib/v3-core/contracts/interfaces/IUniswapV3Factory.sol (>=0.5.0)
//     lib/v3-core/contracts/UniswapV3PoolDeployer.sol (=0.8.12)
//     lib/v3-core/contracts/NoDelegateCall.sol (=0.8.12)
//     lib/v3-core/contracts/UniswapV3Pool.sol (=0.8.12)
//     lib/v3-core/contracts/interfaces/pool/IUniswapV3PoolImmutables.sol (>=0.5.0)
//     lib/v3-core/contracts/interfaces/pool/IUniswapV3PoolState.sol (>=0.5.0)
//     lib/v3-core/contracts/interfaces/pool/IUniswapV3PoolDerivedState.sol (>=0.5.0)
//     lib/v3-core/contracts/interfaces/pool/IUniswapV3PoolActions.sol (>=0.5.0)
//     lib/v3-core/contracts/interfaces/pool/IUniswapV3PoolOwnerActions.sol (>=0.5.0)
//     lib/v3-core/contracts/interfaces/pool/IUniswapV3PoolErrors.sol (>=0.5.0)
//     lib/v3-core/contracts/interfaces/pool/IUniswapV3PoolEvents.sol (>=0.5.0)
//     lib/v3-core/contracts/interfaces/IUniswapV3Pool.sol (>=0.5.0)
//     lib/v3-periphery/contracts/libraries/SafeERC20Namer.sol (>=0.8.0)
//     lib/v3-periphery/contracts/libraries/ChainId.sol (>=0.7.0)
//     lib/v3-periphery/contracts/interfaces/INonfungiblePositionManager.sol (>=0.7.5)
//     lib/v3-periphery/contracts/interfaces/INonfungibleTokenPositionDescriptor.sol (>=0.5.0)
//     lib/v3-periphery/contracts/interfaces/IERC20Metadata.sol (^0.8.0)
//     lib/v3-periphery/contracts/libraries/PoolAddress.sol (>=0.5.0)
//     lib/v3-periphery/contracts/libraries/NFTDescriptor.sol (>=0.7.0)
//     lib/v3-periphery/contracts/libraries/TokenRatioSortOrder.sol (^0.8.0)
//     lib/v3-core/contracts/interfaces/IUniswapV3Pool.sol (>=0.5.0)
//     lib/v3-core/contracts/libraries/FixedPoint128.sol (>=0.4.0)
//     lib/v3-core/contracts/libraries/FullMath.sol (^0.8.0)
//     lib/v3-periphery/contracts/interfaces/INonfungiblePositionManager.sol (>=0.7.5)
//     lib/v3-periphery/contracts/interfaces/INonfungibleTokenPositionDescriptor.sol (>=0.5.0)
//     lib/v3-periphery/contracts/libraries/PositionKey.sol (>=0.5.0)
//     lib/v3-periphery/contracts/libraries/PoolAddress.sol (>=0.5.0)
//     lib/v3-periphery/contracts/base/LiquidityManagement.sol (=0.8.15)
//     lib/v3-periphery/contracts/base/PeripheryImmutableState.sol (=0.8.15)
//     lib/v3-periphery/contracts/base/Multicall.sol (=0.8.15)
//     lib/v3-periphery/contracts/base/ERC721Permit.sol (=0.8.15)
//     lib/v3-periphery/contracts/base/PeripheryValidation.sol (=0.8.15)
//     lib/v3-periphery/contracts/base/SelfPermit.sol (>=0.5.0)
//     lib/v3-periphery/contracts/base/PoolInitializer.sol (=0.8.15)
//     lib/v3-core/contracts/libraries/SafeCast.sol (>=0.5.0)
//     lib/v3-core/contracts/libraries/TickMath.sol (^0.8.0)
//     lib/v3-core/contracts/interfaces/IUniswapV3Pool.sol (>=0.5.0)
//     lib/v3-periphery/contracts/interfaces/ISwapRouter.sol (>=0.7.5)
//     lib/v3-periphery/contracts/base/PeripheryImmutableState.sol (=0.8.15)
//     lib/v3-periphery/contracts/base/PeripheryValidation.sol (=0.8.15)
//     lib/v3-periphery/contracts/base/PeripheryPaymentsWithFee.sol (>=0.7.5)
//     lib/v3-periphery/contracts/base/Multicall.sol (=0.8.15)
//     lib/v3-periphery/contracts/base/SelfPermit.sol (>=0.5.0)
//     lib/v3-periphery/contracts/libraries/Path.sol (>=0.6.0)
//     lib/v3-periphery/contracts/libraries/PoolAddress.sol (>=0.5.0)
//     lib/v3-periphery/contracts/libraries/CallbackValidation.sol (^0.8.0)
//     lib/v3-periphery/contracts/interfaces/external/IWETH9.sol (=0.8.15)
//     lib/v3-core/contracts/interfaces/IUniswapV3PoolDeployer.sol (>=0.5.0)
//     lib/v3-core/contracts/UniswapV3Pool.sol (=0.8.12)
//     lib/v3-core/contracts/interfaces/IUniswapV3Pool.sol (>=0.5.0)
//     lib/v3-core/contracts/NoDelegateCall.sol (=0.8.12)
//     lib/v3-core/contracts/libraries/SafeCast.sol (>=0.5.0)
//     lib/v3-core/contracts/libraries/Tick.sol (^0.8.0)
//     lib/v3-core/contracts/libraries/TickBitmap.sol (^0.8.0)
//     lib/v3-core/contracts/libraries/Position.sol (^0.8.0)
//     lib/v3-core/contracts/libraries/Oracle.sol (^0.8.0)
//     lib/v3-core/contracts/libraries/FullMath.sol (^0.8.0)
//     lib/v3-core/contracts/libraries/FixedPoint128.sol (>=0.4.0)
//     lib/v3-core/contracts/libraries/TransferHelper.sol (>=0.6.0)
//     lib/v3-core/contracts/libraries/TickMath.sol (^0.8.0)
//     lib/v3-core/contracts/libraries/SqrtPriceMath.sol (^0.8.0)
//     lib/v3-core/contracts/libraries/SwapMath.sol (^0.8.0)
//     lib/v3-core/contracts/interfaces/IUniswapV3PoolDeployer.sol (>=0.5.0)
//     lib/v3-core/contracts/interfaces/IUniswapV3Factory.sol (>=0.5.0)
//     lib/v3-core/contracts/interfaces/IERC20Minimal.sol (>=0.5.0)
//     lib/v3-core/contracts/interfaces/callback/IUniswapV3MintCallback.sol (>=0.5.0)
//     lib/v3-core/contracts/interfaces/callback/IUniswapV3SwapCallback.sol (>=0.5.0)
//     lib/v3-core/contracts/interfaces/callback/IUniswapV3FlashCallback.sol (>=0.5.0)
//     lib/v3-periphery/contracts/libraries/AddressStringUtil.sol (>=0.8.0)
//     lib/openzeppelin-contracts/contracts/token/ERC721/extensions/IERC721Metadata.sol (^0.8.0)
//     lib/openzeppelin-contracts/contracts/token/ERC721/extensions/IERC721Enumerable.sol (^0.8.0)
//     lib/v3-periphery/contracts/interfaces/IPoolInitializer.sol (>=0.7.5)
//     lib/v3-periphery/contracts/interfaces/IERC721Permit.sol (>=0.7.5)
//     lib/v3-periphery/contracts/interfaces/IPeripheryPayments.sol (>=0.7.5)
//     lib/v3-periphery/contracts/interfaces/IPeripheryImmutableState.sol (>=0.5.0)
//     lib/v3-periphery/contracts/libraries/PoolAddress.sol (>=0.5.0)
//     lib/v3-periphery/contracts/interfaces/INonfungiblePositionManager.sol (>=0.7.5)
//     lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol (^0.8.0)
//     lib/v3-core/contracts/interfaces/IUniswapV3Pool.sol (>=0.5.0)
//     lib/v3-core/contracts/libraries/TickMath.sol (^0.8.0)
//     lib/v3-core/contracts/libraries/BitMath.sol (^0.8.0)
//     lib/v3-core/contracts/libraries/FullMath.sol (^0.8.0)
//     lib/openzeppelin-contracts/contracts/utils/Strings.sol (^0.8.0)
//     lib/base64-sol/base64.sol (>=0.6.0)
//     lib/v3-periphery/contracts/libraries/HexStrings.sol (^0.8.0)
//     lib/v3-periphery/contracts/libraries/NFTSVG.sol (>=0.7.6)
//     lib/v3-core/contracts/interfaces/IUniswapV3Factory.sol (>=0.5.0)
//     lib/v3-core/contracts/interfaces/callback/IUniswapV3MintCallback.sol (>=0.5.0)
//     lib/v3-core/contracts/libraries/TickMath.sol (^0.8.0)
//     lib/v3-periphery/contracts/libraries/PoolAddress.sol (>=0.5.0)
//     lib/v3-periphery/contracts/libraries/CallbackValidation.sol (^0.8.0)
//     lib/v3-periphery/contracts/libraries/LiquidityAmounts.sol (>=0.5.0)
//     lib/v3-periphery/contracts/base/PeripheryPayments.sol (>=0.7.5)
//     lib/v3-periphery/contracts/base/PeripheryImmutableState.sol (=0.8.15)
//     lib/v3-periphery/contracts/interfaces/IPeripheryImmutableState.sol (>=0.5.0)
//     lib/v3-periphery/contracts/interfaces/IMulticall.sol (>=0.7.5)
//     lib/openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721Enumerable.sol (^0.8.0)
//     lib/openzeppelin-contracts/contracts/utils/Address.sol (^0.8.1)
//     lib/v3-periphery/contracts/libraries/ChainId.sol (>=0.7.0)
//     lib/v3-periphery/contracts/interfaces/external/IERC1271.sol (>=0.5.0)
//     lib/v3-periphery/contracts/interfaces/IERC721Permit.sol (>=0.7.5)
//     lib/v3-periphery/contracts/base/BlockTimestamp.sol (=0.8.15)
//     lib/v3-periphery/contracts/base/BlockTimestamp.sol (=0.8.15)
//     lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol (^0.8.0)
//     lib/openzeppelin-contracts/contracts/token/ERC20/extensions/draft-IERC20Permit.sol (^0.8.0)
//     lib/v3-periphery/contracts/interfaces/ISelfPermit.sol (>=0.7.5)
//     lib/v3-periphery/contracts/interfaces/external/IERC20PermitAllowed.sol (>=0.5.0)
//     lib/v3-core/contracts/interfaces/IUniswapV3Factory.sol (>=0.5.0)
//     lib/v3-core/contracts/interfaces/IUniswapV3Pool.sol (>=0.5.0)
//     lib/v3-periphery/contracts/base/PeripheryImmutableState.sol (=0.8.15)
//     lib/v3-periphery/contracts/interfaces/IPoolInitializer.sol (>=0.7.5)
//     lib/v3-core/contracts/interfaces/callback/IUniswapV3SwapCallback.sol (>=0.5.0)
//     lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol (^0.8.0)
//     lib/v3-periphery/contracts/base/PeripheryPayments.sol (>=0.7.5)
//     lib/v3-periphery/contracts/interfaces/IPeripheryPaymentsWithFee.sol (>=0.7.5)
//     lib/v3-periphery/contracts/interfaces/external/IWETH9.sol (=0.8.15)
//     lib/v3-periphery/contracts/libraries/TransferHelper.sol (>=0.6.0)
//     lib/v3-periphery/contracts/libraries/BytesLib.sol (>=0.8.0 <0.9.0)
//     lib/v3-core/contracts/interfaces/IUniswapV3Pool.sol (>=0.5.0)
//     lib/v3-periphery/contracts/libraries/PoolAddress.sol (>=0.5.0)
//     lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol (^0.8.0)
//     lib/v3-core/contracts/libraries/SafeCast.sol (>=0.5.0)
//     lib/v3-core/contracts/libraries/TickMath.sol (^0.8.0)
//     lib/v3-core/contracts/libraries/BitMath.sol (^0.8.0)
//     lib/v3-core/contracts/libraries/FullMath.sol (^0.8.0)
//     lib/v3-core/contracts/libraries/FixedPoint128.sol (>=0.4.0)
//     lib/v3-core/contracts/interfaces/IERC20Minimal.sol (>=0.5.0)
//     lib/v3-core/contracts/libraries/SafeCast.sol (>=0.5.0)
//     lib/v3-core/contracts/libraries/FullMath.sol (^0.8.0)
//     lib/v3-core/contracts/libraries/UnsafeMath.sol (>=0.5.0)
//     lib/v3-core/contracts/libraries/FixedPoint96.sol (>=0.4.0)
//     lib/v3-core/contracts/libraries/FullMath.sol (^0.8.0)
//     lib/v3-core/contracts/libraries/SqrtPriceMath.sol (^0.8.0)
//     lib/openzeppelin-contracts/contracts/token/ERC721/IERC721.sol (^0.8.0)
//     lib/openzeppelin-contracts/contracts/token/ERC721/IERC721.sol (^0.8.0)
//     lib/openzeppelin-contracts/contracts/token/ERC721/IERC721.sol (^0.8.0)
//     lib/openzeppelin-contracts/contracts/utils/Strings.sol (^0.8.0)
//     lib/v3-core/contracts/libraries/BitMath.sol (^0.8.0)
//     lib/base64-sol/base64.sol (>=0.6.0)
//     lib/v3-core/contracts/libraries/FullMath.sol (^0.8.0)
//     lib/v3-core/contracts/libraries/FixedPoint96.sol (>=0.4.0)
//     lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol (^0.8.0)
//     lib/v3-periphery/contracts/interfaces/IPeripheryPayments.sol (>=0.7.5)
//     lib/v3-periphery/contracts/interfaces/external/IWETH9.sol (=0.8.15)
//     lib/v3-periphery/contracts/libraries/TransferHelper.sol (>=0.6.0)
//     lib/v3-periphery/contracts/base/PeripheryImmutableState.sol (=0.8.15)
//     lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol (^0.8.0)
//     lib/openzeppelin-contracts/contracts/token/ERC721/extensions/IERC721Enumerable.sol (^0.8.0)
//     lib/v3-periphery/contracts/interfaces/IPeripheryPayments.sol (>=0.7.5)
//     lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol (^0.8.0)
//     lib/openzeppelin-contracts/contracts/utils/introspection/IERC165.sol (^0.8.0)
//     lib/openzeppelin-contracts/contracts/token/ERC721/IERC721.sol (^0.8.0)
//     lib/openzeppelin-contracts/contracts/token/ERC721/IERC721Receiver.sol (^0.8.0)
//     lib/openzeppelin-contracts/contracts/token/ERC721/extensions/IERC721Metadata.sol (^0.8.0)
//     lib/openzeppelin-contracts/contracts/utils/Address.sol (^0.8.1)
//     lib/openzeppelin-contracts/contracts/utils/Context.sol (^0.8.0)
//     lib/openzeppelin-contracts/contracts/utils/Strings.sol (^0.8.0)
//     lib/openzeppelin-contracts/contracts/utils/introspection/ERC165.sol (^0.8.0)
//     lib/openzeppelin-contracts/contracts/utils/introspection/IERC165.sol (^0.8.0)

// For context the following versions of the libs were installed:
// uniswap/v3-core@0.8
// uniswap/v3-periphery@0.8
// openzeppelin/openzeppelin-contracts@release-v4.6

import { UniswapV3Factory } from "@uniswap/v3-core/contracts/UniswapV3Factory.sol";
import { IUniswapV3Pool } from "@uniswap/v3-core/contracts/interfaces/IUniswapV3Pool.sol";
import { INonfungibleTokenPositionDescriptor } from "@uniswap/v3-periphery/contracts/NonfungibleTokenPositionDescriptor.sol";
import { NonfungiblePositionManager } from "@uniswap/v3-periphery/contracts/NonfungiblePositionManager.sol";
import { SwapRouter } from "@uniswap/v3-periphery/contracts/SwapRouter.sol";

contract UniswapTest is PRBTest, StdCheats {

    // Uniswap V3 contracts
    UniswapV3Factory internal uniswapV3Factory;
    NonfungibleTokenPositionDescriptor internal nonfungibleTokenPositionDescriptor;
    NonfungiblePositionManager internal nonfungiblePositionManager;
    SwapRouter internal swapRouter;

    function setUp() public virtual {
        uniswapV3Factory = new UniswapV3Factory();
        nonfungibleTokenPositionDescriptor = new NonfungibleTokenPositionDescriptor(address(weth), "ETH");
        nonfungiblePositionManager = new NonfungiblePositionManager(
            address(uniswapV3Factory),
            address(weth),
            address(nonfungibleTokenPositionDescriptor)
        );
        swapRouter = new SwapRouter(address(uniswapV3Factory), address(weth));
    }

    function test_Uniswap() external {
    }
}
