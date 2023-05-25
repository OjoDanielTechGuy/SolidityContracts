// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract UsingEvent {

    mapping(address => uint) public tokenBalance;

    //Adding solidity event
    event tokenSent(address _from, address _to, uint _amount);

    constructor() {
        tokenBalance[msg.sender] = 100;
    }
/*Normally, there is no decoded output. Sending a transaction is a concurrent operation that usually doesn't have a return value.
When using Injected Provider as environment there is no such as return value
-
Events are there to return values for a transaction*/
    function sendToken(address _to, uint _amount) public returns (bool){
        
        require(tokenBalance[msg.sender] >= _amount, "Not enough token to send");
        assert(tokenBalance[_to] + _amount >= tokenBalance[_to]);
        assert(tokenBalance[msg.sender] - _amount <= tokenBalance[msg.sender]);
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;

        //emitting event to return value in a real blockchain
        //"logs" ae displayed in transaction details. These are in-sequence emitted events from the Smart Contract execution!
        emit tokenSent(msg.sender, _to, _amount);

        return true;
    } 
}