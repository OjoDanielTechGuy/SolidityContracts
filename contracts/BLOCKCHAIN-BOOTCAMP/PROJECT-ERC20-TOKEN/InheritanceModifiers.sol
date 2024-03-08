//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract InheritanceModifier {
    
    mapping(address => uint) public tokenBalance;

    address owner;

    uint tokenPrice = 1 ether;

    constructor() {
        owner = msg.sender;
        tokenBalance[owner] = 100;
    }

/** we have several similar require statements, 

* They are all testing if a specific address called the smart contract
* To avoid code duplication and make it easier to change this from a single place, 
a modifier is used.
*
* Modifiers avoids the duplication of codes thereby can be reused by calling
- it's modifier name in the function creation
*
* In the modifier, the "_;" sign is replaced by a function statement that calls the modifier
*/

    modifier onlyOwner {
        require(msg.sender == owner, "Address is not owner");
       _;
    }

    // function createNewToken() public {
    function createNewToken() public onlyOwner {
        // require(msg.sender == owner, "Address is not owner");
        tokenBalance[owner]++;
    }

    // function burnToken() public {
    function burnToken() public onlyOwner{
        // require(msg.sender == owner, "Address is not owner");
        tokenBalance[owner]--;
    }

    //function to purchase using payable for payment
    function purchaseToken() public payable {

        require((tokenBalance[owner] * tokenPrice) / msg.value > 0, "not enough funds");
        tokenBalance[owner] -= msg.value / tokenPrice;
        tokenBalance[msg.sender] += msg.value / tokenPrice;
    }

    //function to send Token to an address
    function sendToken(address _to, uint _amount) public {
        require(tokenBalance[msg.sender] >= _amount, "Not enough token");
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;
    }

}