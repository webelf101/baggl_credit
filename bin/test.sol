// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

interface ERC20 {
    function balanceOf(address) external returns(uint256);
    function transferFrom(address, address, uint256) external;
    function transfer(address, uint256) external;
    function approve(address, uint256) external;
}

interface Gauge {
    function exchange(int128, int128, uint256, uint256) external;
    function exchange_underlying(int128, int128, uint256, uint256) external;
}

contract Test {

    ERC20 public token1;
    ERC20 public token2;
    Gauge public gauge;
    ERC20 public tracker;
    address public owner;

    constructor() {
        owner = msg.sender;
        token1 = ERC20(0x5592EC0cfb4dbc12D3aB100b257153436a1f0FEa);
        token2 = ERC20(0x4DBCdF9B62e891a7cec5A2568C3F4FAF9E8Abe2b);
        gauge = Gauge(0x19e0f5Ab5Cb0cEE03EcD5D20a0f66FF0E8851ca7);
    }

    function run() external {
        token1.approve(address(gauge), uint256(-1));
        gauge.exchange_underlying(0, 1, 10000, 0);
        uint256 amount = token2.balanceOf(address(this));
        token2.transfer(owner, amount);
    }


}
