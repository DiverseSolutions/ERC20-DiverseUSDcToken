// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "./IERC20.sol";

// File: contracts/v1/AbstractFiatTokenV1.sol
abstract contract AbstractFiatTokenV1 is IERC20 {
    function _approve(
        address owner,
        address spender,
        uint256 value
    ) internal virtual;

    function _transfer(
        address from,
        address to,
        uint256 value
    ) internal virtual;
}
