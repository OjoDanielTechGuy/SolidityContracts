// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract MappingStructExample {

    mapping(address => uint) public balanceReceived;

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

/*When one uses this function, the msg.value(amount in Wei) is tracked with the balanceReceived mapping
for the person who interacted with the smart contract*/
    function sendMoney() public payable {
        balanceReceived[msg.sender] += msg.value;
    }

    //Adding partial withdrawals
    function withdrawMoney(address payable _to, uint _amount) public {
        //reqire to ascertain that the smart contract caller is the owner
        require(balanceReceived[msg.sender] >= _amount, "not enough funds to transfer");

        //subtracting the amount in store to the amount sent
        balanceReceived[msg.sender] -= _amount;

        //transfer the remaining amount
        _to.transfer(_amount);

    }
 
 /*If same person who calls the smart contract calls this function, the mapping balancedReceived
 to ascertain how much sent then reset mapping and send the amount*/
    function withdrawAllMoney(address payable _to) public {

        uint balanceToSend = balanceReceived[msg.sender];
        balanceReceived[msg.sender] = 0;
        _to.transfer(balanceToSend);
    }
}