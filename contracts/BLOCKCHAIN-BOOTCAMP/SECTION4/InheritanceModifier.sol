//SPDX-License-Ientifier: MIT

pragma solidity ^0.8.14;

//splitting smart contract
contract Owner {

    address owner;

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "You are not allowed to perform this operation");
    _;
    }
}

//this contract demonstrate how modifiers and inheritance works!
contract UsingInheritanceModifier is Owner{

    //mapping to store token balance as uint
    mapping(address => uint) public tokenBalance;

    uint tokenPrice = 1 ether;

    constructor() {
        // owner = msg.sender;
        tokenBalance[owner] = 100;
    }

/*Right now we have several similar require statements. 
 - They are all testing if a specific address called the smart contract. 
- To avoid code duplication and make it easier to change this from a single place, we can use modifiers:*/

//Modifiers are a great way to check pre-conditions
// modifier onlyOwner() {
//     require(msg.sender == owner, "You are not allowed to perform this operation");
//     _;
// }

    function createNewToken() public onlyOwner{
        // require(msg.sender == owner, "You are not allowed to perform this operation");
        tokenBalance[owner]++;
    }

    function burnToken() public onlyOwner {
        // require(msg.sender == owner, "You are not allowed to perform this operation");
        tokenBalance[owner]--;
    }

    function purchaseToken() public payable {
        require(tokenBalance[owner] * tokenPrice / msg.value > 0, "not enough token");
        tokenBalance[owner] -= msg.value / tokenPrice;
        tokenBalance[msg.sender] += msg.value / tokenPrice;
    }

    function sendToken(address _to, uint _amount) public {
        require(tokenBalance[msg.sender] >= _amount, "not enought tokens");
        assert(tokenBalance[_to] + _amount >= tokenBalance[_to]);
        assert(tokenBalance[msg.sender] - _amount <= tokenBalance[msg.sender]);
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;
    }



}