// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract VariousFunctions {
    
    mapping(address => uint) public balanceReceived;

    /*The Solidity Constructor: A constructor is a function that is called once during deployment of the Smart Contract. 
    It's also called once only and can't be called again afterwards.
    This lets you set specific things in your Smart Contract during deployment. */

    address payable owner;

    constructor() {
        owner = payable(msg.sender);
    }


    /*There are two types of reading functions:

    view: Accessing state variables (serves as reading function)
    pure: Not accessing state variables
    */
    function getOwner() public view returns(address) {
        return owner;
    }

    function convertToWei(uint _amount) public pure returns(uint) {
        return _amount / 1 ether;
    }

    //destroy the smart contract
    function destroySmartContract() public {
        require(owner == msg.sender, "You are not the owner");
        selfdestruct(owner);
    }

    function receiveMoney() public payable {
        assert(balanceReceived[msg.sender] + msg.value >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable _to, uint _amount) public {
        require(_amount <= balanceReceived[msg.sender], "not enough funds to perform actions");
        assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount);
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }

    /*The receive fallback function:
    - This function can be use to interact with the smart contract without directly interacting with a concrete function*/
    
    receive() external payable {
        receiveMoney();
    }
}