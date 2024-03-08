//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.14;

contract MappingWithStruct {
//this struct stores the amount and the time stamp of any incoming/outgoing transaction
    struct Transaction { 
        uint amount;
        uint timestamp;
    }

//this struct stores the total balance and a mapping of all payments done
    struct Balance {
        uint totalBalance;
        uint numDeposits; //helper to store the lenth of the deposits mapping
        mapping (uint => Transaction) deposits;
        uint numWithdrawals; 
        mapping (uint => Transaction) withdrawals;        
    }

    mapping(address => Balance) public balanceReceived;

    function getBalance(address _addr) public view returns(uint) {
        return balanceReceived[_addr].totalBalance;
    }

    function depositMoney() public payable {
        balanceReceived[msg.sender].totalBalance += msg.value;

        Transaction memory deposit = Transaction(msg.value, block.timestamp);
        balanceReceived[msg.sender].deposits[balanceReceived[msg.sender].numDeposits] = deposit;
        balanceReceived[msg.sender].numDeposits++;
    }

    function withdrawMoney(address payable _to, uint _amount) public payable{
        balanceReceived[msg.sender].totalBalance -= _amount; //reduce the balance by the amount of withdrawn

        //record a new withdrawal
        Transaction memory withdrawal = Transaction(msg.value, block.timestamp);
        balanceReceived[msg.sender].withdrawals[balanceReceived[msg.sender].numWithdrawals] = withdrawal;
        balanceReceived[msg.sender].numWithdrawals++;

        //send the amount out of balance
        _to.transfer(_amount);
    }
}