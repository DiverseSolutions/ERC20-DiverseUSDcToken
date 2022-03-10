// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "./AbstractFiatTokenV1.sol";

// File: contracts/v2/AbstractFiatTokenV2.sol
abstract contract AbstractFiatTokenV2 is AbstractFiatTokenV1 {
    function _increaseAllowance(
        address owner,
        address spender,
        uint256 increment
    ) internal virtual;

    function _decreaseAllowance(
        address owner,
        address spender,
        uint256 decrement
    ) internal virtual;
}
