//Ownable Functionality

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Ownable {

    address public _owner;

    //initializing owner of contract at program start
    constructor() {
        _owner = msg.sender;
    }

    //modifier to throw error when contract is called by another account
    modifier onlyOwner {
        require(isOwner(), "Ownable: caller is not the owner");
        _;
    }

    //function to return true if the caller is the contract owner
    function isOwner() public view returns (bool) {
        return (msg.sender == _owner);
    }
}