//SPDX-License-Identifier: UNLICENSED



pragma solidity ^0.8.14;

contract  SendMoneyExample{

    uint public balanceReceived;

    /*to deal with Money in solidity payable keyword is used
    - The msg-object is a global always-existing object containing a few informations about the ongoing transaction
    This function also receive Ether*/
    
    function sendMoney() public payable {
        balanceReceived += msg.value;
    }

    /*getting balance of an address
    
    - view function is a function that doesn't alter the storage (read-only) and can return information. 
     It doesn't need to be mined and it is virtually free of charge.*/

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    //this function withdraws to the exact address provided
    function withdrawMoneyToAddress(address payable _to) public{
        _to.transfer(this.getBalance());
    }
}