//SPDX-License-Identifier: UNLICENSED

/**
Introducing ERC20 tokens standard 

ERC20 tokens provide functionalities to

- transfer tokens
- allow others to transfer tokens on behalf of the token holder

**/

//https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol

pragma solidity ^0.8.19;

interface IERC20 {

    function totalSupply() external view returns(uint);

    function balanceOf(address account) external view returns (uint);

    function transfer(address recipient, uint amount) external returns(bool);

    function allowance(address owner, address spender) external view returns(uint);

    function approve(address sender, uint amount) external returns (bool);

    function transferFrom(address sender, address recipient, uint amount) external returns(bool);

    event Transfer(address indexed from, address indexed to, uint value);
    
    event Approval(address indexed owner, address indexed spender, uint value);
}
