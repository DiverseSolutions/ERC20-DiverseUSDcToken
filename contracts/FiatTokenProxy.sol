// SPDX-License-Identifier: MIT
pragma solidity ^0.4.24;

import "./Proxy/AdminUpgradeabilityProxy.sol";

// File: contracts/FiatTokenProxy.sol

/**
 * @title FiatTokenProxy
 * @dev This contract proxies FiatToken calls and enables FiatToken upgrades
*/ 
contract FiatTokenProxy is AdminUpgradeabilityProxy {
    constructor(address _implementation) public AdminUpgradeabilityProxy(_implementation) {
    }
}
