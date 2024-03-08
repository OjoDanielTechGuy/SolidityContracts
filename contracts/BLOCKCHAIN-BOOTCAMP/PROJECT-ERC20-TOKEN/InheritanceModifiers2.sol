//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

/**
* Splitting the smart contract into small pieces:
*************
* Two Smart Contract are created, one that manages the ownership, 
and another one that does the Token logic:
*/

contract Owned {
    //this contract manages the ownership

    address owner;

    constructor() {
        owner = msg.sender;        
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Address is not owner");
       _;
    }

}

//this contract does the token logic
contract InheritanceModifier2 is Owned { 
    //a contract by inherit another contract by using "is" with the contract name
    
    mapping(address => uint) public tokenBalance;

    uint tokenPrice = 1 ether;

    constructor() {
        tokenBalance[owner] = 100;
    }

    // function createNewToken() public {
    function createNewToken() public onlyOwner {        
        tokenBalance[owner]++;
    }

    // function burnToken() public {
    function burnToken() public onlyOwner{        
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

        /**assert is used to validate the internal local state of the function. 
        * It should be used when you think that a current state has the potential to become 
        * inconsistent.*/

        assert(tokenBalance[_to] + _amount >= tokenBalance[_to]);
        assert(tokenBalance[msg.sender] - _amount <= tokenBalance[msg.sender]);
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;
    }

}

/*Note: its not ideal to have multiple contracts in one file.
hence we can also separate them and import contracts.*/
