// SPDX-License-Identifier: MIT

pragma solidity 0.7.0;

import "./token/BagglCreditToken.sol";

contract BagglAccount {
    BagglCreditToken token;
    mapping (address => uint256) private _debit;
    mapping (address => uint256) private _userId;
    
}