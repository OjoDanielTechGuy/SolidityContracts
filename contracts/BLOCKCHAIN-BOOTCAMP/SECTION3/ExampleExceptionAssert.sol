//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14; 

/**Assert is used to check invariants 
(states of our contract or variables should never reach)
- Assert is here to check status of your Smart Contract that should never be violated
*/
contract UsingAssert {
        
    mapping (address => uint8) public balanceReceived;//balance of account is stored here

    function receiveMoney() public payable { //sending ether to smart contract
        //uint goes from 0  to 2^n-1 => 2^8-1 or 255
        assert(msg.value == uint8(msg.value));//if false stop execution
        balanceReceived[msg.sender] += uint8(msg.value);  
        assert(balanceReceived[msg.sender] >= uint8(msg.value));
    }

    function withdrawMoney(address payable _to, uint8 _amount) public {
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
        assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount);

        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
}