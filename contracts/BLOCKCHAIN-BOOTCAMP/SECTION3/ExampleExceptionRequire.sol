//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14; 

/**require is a type of exception in Solidity, 
It's used for input validation 
It returns the gas left unspent after*/
contract UsingRequire {
        
    mapping (address => uint) public balanceReceived;//balance of account is stored here

    function receiveMoney() public payable { //sending ether to smart contract
        balanceReceived[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable _to, uint _amount) public {
        /**using If - this works but does not render any error when the statement is false,
        when there is not enough balance, then it simply does nothing, there is no alert of message
        to show user-feeback

        if (_amount <= balanceReceived[msg.sender]) {
            balanceReceived[msg.sender] -= _amount;
            _to.transfer(_amount);
        }*/

        /**using require error exception handling (user-input validation)
        if it evaultes to false, it throws an exception*/
        require(_amount <= balanceReceived[msg.sender], "Insufficient funds");

        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }

}