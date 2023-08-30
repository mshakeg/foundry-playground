// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0;

import { IFoo } from "./interfaces/IFoo.sol";

contract Foo is IFoo {
    function id(uint256 value) external pure override returns (uint256) {
        return value;
    }
}
