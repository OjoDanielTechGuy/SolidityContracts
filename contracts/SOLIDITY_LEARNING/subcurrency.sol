// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

//contract allows only creator to create new coins (different issuance are possible)
//Ethereum keypair is needed to send coins to each other

contract Coin {

    address public minter;
    //mapping to hold balances of an address
    mapping (address => uint) public balances;

    /*
    Event: events allows user or client to respond to specific changes
    Event is an inheritable member of a contract, An event is emitted. It stores the arguements passed in the transaction logs
    These logs are stored on blockchain and are accessible using an address  of the contract till the contract is present on the blockchain
    */
    //an event to display the action carried out
    event Sent(address _from, address _to, uint _amount);

    //this is called immediately the contract runs
    constructor() {
        minter = msg.sender;
    }

    //make new coins and send to an address
    //only owner should be able to send coins
    function mint(address _receiver, uint _amount) public {

        require(msg.sender == minter, "You are not owner of contract");
        balances[_receiver] += _amount;
    }

    //error - specifies that this variable houses error parameters or command
    error insufficientBalance(uint requested, uint available);
    
    //function to send coins to an existing address
    function send(address _receiver, uint _amount) public {
        //condition: if the amount is greater than balance stop transaction
        if(_amount > balances[msg.sender]) 
        
        //revert keyword will cancel the function and revert the error variable
        revert insufficientBalance ({
                requested: _amount,
                available: balances[msg.sender]
        });
             
        balances[msg.sender] -= _amount;
        balances[_receiver] += _amount;

        //emitting event
        emit Sent(msg.sender, _receiver, _amount);
    }

    //    //function to send coins to an existing address
    // function send(address _receiver, uint _amount) public {
    //     //condition: if the amount is greater that balance stop transaction
    //     require(_amount > balances[msg.sender], "Insufficient fund to transfer");

    //     balances[msg.sender] -= _amount;
    //     balances[_receiver] += _amount;
    // }
}
