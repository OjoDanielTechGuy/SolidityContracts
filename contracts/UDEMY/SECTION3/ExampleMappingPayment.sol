//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.14;

contract MappingPayment {
    //Payment Smart Contract can keep track of deposits and withdrawals in an easy way using mappings

    /**The Smart Contract is very simplistic. 
    It allows everyone to send Ether to the Smart Contract. 
    But it also allows everyone to transfer all funds from the Smart Contract to any address. 
    Not very secure - yet.
    */

    //Let's make it a bit more secure! more -functionalities added

    mapping(address => uint) public balanceReceived; //Mapping to track Deposits

    function getBalance() public view returns(uint) {
        return address(this).balance;//holds the address and display the balance of the address
    }

    function sendMoney() public payable{
        /**When someone sends money using the "sendMoney" function, 
        we track the msg.value (amount in Wei) with the balanceReceived mapping for the 
        person who interacted with the Smart Contract.
        */
        balanceReceived[msg.sender] += msg.value; 
        
    }

    function getAddressOfSender() public view returns(address){
        return msg.sender; //returns address of the sender
    }

    function withdrawAllMoney(address payable _to) public {
        /**If that same person tries to withdraw money again using "withdrawAllMoney", 
        we look in that mapping how much he sent there previously, 
        then reset the mapping and send the amount.
        */
        uint balanceToSend = balanceReceived[msg.sender];
        balanceReceived[msg.sender] = 0; //resetting mapping
        _to.transfer(balanceToSend); //transfer the amount equivalent to the address
    }

}