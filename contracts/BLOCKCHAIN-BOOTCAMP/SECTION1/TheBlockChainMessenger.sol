//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

/**
In this project, implement a simple messenger functionality in a Smart Contract.

Through the constructor make sure you write the address that deployed the contract to a variable
Create a message-variable of the type string, that only the deployer-address can update
Create a counter, to see how many times the variable was updated.
*/
contract TheBlockChainMessenger {

    uint public changeCounter;

    address public owner;

    string public theMessage;
    
    //constructor to write address as owner
    constructor() {
        owner = msg.sender;
    }

    function updateTheMessage(string memory _newMessage) public {
        
        if(owner == msg.sender) {
            theMessage = _newMessage;
            changeCounter++;
        }
    }

}