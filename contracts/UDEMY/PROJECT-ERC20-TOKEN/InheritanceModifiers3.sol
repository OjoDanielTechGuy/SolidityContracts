//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract Owned {

    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Address is not the caller of the contract");
        _;
    }

}