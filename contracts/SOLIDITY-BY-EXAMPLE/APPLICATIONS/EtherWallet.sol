//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

//This contract simply allows to send ETH and only the owner can withdraw

contract Wallet {
    
    address payable public owner;

    constructor() {
        owner = payable (msg.sender);
    }

    receive() external payable{}

    function withdraw(uint _amount) external {
        require(msg.sender == owner, "You are not the owner");
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() external view returns(uint) {
        return address(this).balance;
    }

}