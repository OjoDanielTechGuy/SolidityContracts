// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 <= 0.9.0;

/*
Abstraction: Decentraliezed exchange: On a smart contract traders can trade tokens - from the 
smart contract emit an event so that they can get data (web front end)
--

After emitting events, entities outside the blockchain has access to read them
*/

contract UsingEvent {

    //1. declare event
    //2. emit event

    //use CamelCase to name event. Only use 3 indexed per event to the high fee via ethereum
    
    event NewTrade (

        uint indexed date,
        address from,
        address indexed to,
        uint indexed amount
    );

    function trade (address _from, address _to, uint _amount) external {
        //outside the effects of event can be seen through web3js
        //block.timestamp is a global variable that gives the current timestamp
        emit NewTrade(block.timestamp, _from, _to, _amount);
    }


}
