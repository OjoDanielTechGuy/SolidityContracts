// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

/*SECURING OUR SMART CONTRACT USING A SIMPLE OWNERSHIP MODEL:

Set a storage variable to the address that deployed the Smart Contract. 
Then we will require() that the person interacting with withdrawAllMoney is the same as the one who deployed the Smart Contract

* PAUSING SMART CONTRACTS:
--
Logic can be used (in code) to pause your smart contract,
A simple boolean variable will be added to check if the functionality is paused or not.
--

* DESTROY SMART CONTRACTS USING SELFDESTRUCT
--
Information cannot be erased from blokchain, but the current state can be updated so one won't interact
with an address anymore. Once (selfdestruct) is called, no interaction whatsovere can be done 
on the Smart Contract.
-
The (selfdestruct) takes one arguement, an address. When selfdestruct is called, 
all remaining funds on the address of the Smart Contract are transferred to that address.
-
Note: selfdestruct has been deprecated.
*/

contract StartStopUpdateExample {

    address public owner;
    
    //value to check for paused state
    bool public paused;

    //check balance of Ether
    function checkBalance() public view returns(uint){
        return address(this).balance;
    }

    constructor() {// a function called once to initiate the address
        owner = msg.sender;
    }

    function sendMoney() public payable {
    }

    //pausing the smart contract
    function setPaused(bool _paused) public {
        require(msg.sender == owner, "You cannot pause, not owner of contract");
        paused = _paused;
    }

    //withdraw all money
    function withdrawAllMoney(address payable _to) public {
        require(owner == msg.sender, "You cannot withdraw, not the owner of contract");
        require(paused == false, "Contract Paused");
        _to.transfer(address(this).balance);
    }

    //destroying the smart contract
    function destroySmartContract(address payable _to) public {
        require(msg.sender == owner, "You are the owner, contract cannot be destroyed");
        selfdestruct(_to);
    }
}