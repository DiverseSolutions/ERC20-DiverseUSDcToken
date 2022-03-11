// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "./FiatTokenV2.sol";


// File: contracts/v2/FiatTokenV2_1.sol
/**
 * @title FiatToken V2.1
 * @notice ERC20 Token backed by fiat reserves, version 2.1
 */
contract FiatTokenV2_1 is FiatTokenV2 {
    /**
     * @notice Initialize v2.1
     * @param lostAndFound  The address to which the locked funds are sent
     */
    function initializeV2_1(address lostAndFound) external {
        // solhint-disable-next-line reason-string
        require(_initializedVersion == 1);

        uint256 lockedAmount = balances[address(this)];
        if (lockedAmount > 0) {
            _transfer(address(this), lostAndFound, lockedAmount);
        }
        blacklisted[address(this)] = true;

        _initializedVersion = 2;
    }

    /**
     * @notice Version string for the EIP712 domain separator
     * @return Version string
     */
    function version() external view returns (string memory) {
        return "2";
    }
}
