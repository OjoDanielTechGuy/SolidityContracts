//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.14;

/**Event and Emit is meant for communicating to the outside world with better access to 
* return variables. 
*/

contract EventExample {
    //mapping address to uint
    mapping(address => uint) public tokenBalance;

    //Event is defined inside the contract, not outside the curly brackets of the contract
    event TokenSent(address _from, address _to, uint _amount);

    //constructor on deployment of contract to get 100 tokens
    constructor() {
        tokenBalance[msg.sender] = 100;
    }

    //function to send token to another address to return True or False
    function sendToken(address _to, uint _amount) public returns(bool) {
        require(tokenBalance[msg.sender] >= _amount, "Not enought tokens");
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;

        /**- This event can be used in a function by keyword (emit)
        * - It does not matter where you emit the event
        */
        emit TokenSent(msg.sender, _to, _amount);
        return true;        
    }


}