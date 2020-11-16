// SPDX-License-Identifier: MIT

pragma solidity 0.7.0;

import "./BagglCreditTokenBase.sol";

contract BagglCreditToken is BagglCreditTokenBase {

    constructor (string memory name, string memory symbol, uint8 decimals) BagglCreditTokenBase(name, symbol, decimals) {
        
    }
}