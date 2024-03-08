//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.14;

/**
A smart contract that allows for:

- Deposits from everyone
- Withdrawals only in the amount that was deposited by the person who likes to withdraw
*/
contract SmartMoneyImplementation {
    //sending and withdrawal of money
    uint public balanceReceived;

    //function to deposit money
    function deposit() public payable {
        balanceReceived += msg.value;
    }

    //function to get contract balance
    function getContractBalance() public view returns(uint){
        return address(this).balance;
    }
        
    //this function withdraws to the exact address provided
    function withdrawToAddress(address payable to) public {
        to.transfer(getContractBalance());
    }
}