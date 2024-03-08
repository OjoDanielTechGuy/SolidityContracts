// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

/*A struct is a creative data structure format in Solidity where variables of diverse 
data types can be bundled into one variable or a custom-made type.
--
Once the data types are grouped into a struct, the struct name represents 
the subsets of variables in it. With struct one can access the children element with a .(period).
--
Struct are initialized with their default value and structs allow you to define something similar like cheap class-variables.



Note: Mappings has no length because they are stored internally*/

contract StructMapping {

    //This Struct Payment stores the amount and timestamp of the payment
    struct Payment {
        uint amount;
        uint timestamp;
    }

    //This Struct Balance store the total balance, and mapping of all payments done
    struct Balance {
        uint totalBalance;
        uint numPayments; //to store the length of payments mapping
        mapping(uint => Payment) payments;
    }

    //mapping address to struct of Balance, 
    mapping(address => Balance) public balanceReceived;

    //get balance
    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    //send money function
    function sendMoney() public payable{
        
        balanceReceived[msg.sender].totalBalance += msg.value;

        //creating an instance of struct payment
        Payment memory payment = Payment(msg.value, block.timestamp);
        balanceReceived[msg.sender].payments[balanceReceived[msg.sender].numPayments] = payment;
        balanceReceived[msg.sender].numPayments++;
    }

    //withdraw Money function based on specified amount
    function withdrawMoney(address payable _to, uint _amount) public {
        require(balanceReceived[msg.sender].totalBalance >= _amount, "not enough funds to transfer");
        balanceReceived[msg.sender].totalBalance -= _amount;
        _to.transfer(_amount);
    }

    //function to withdraw all money at once
    function withdrawAllMoney(address payable _to) public {
        uint balanceToSend = balanceReceived[msg.sender].totalBalance;
        balanceReceived[msg.sender].totalBalance = 0;
        _to.transfer(balanceToSend);
    }


}