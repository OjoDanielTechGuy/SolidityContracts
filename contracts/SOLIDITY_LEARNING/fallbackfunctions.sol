// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 <= 0.9.0;

/*
Fallback function Definition:
1. Cannot have a name
2. Does not take an input
3. Does not retun any output
4. Must be declared external 

Why use fall back function ? When you call function that does not exists - or send ether to contract by send, transfer or call
statement: send and transfer method receives 2300 gas but call method receives all (all of the gas)
*/

contract FallBackFunction {

    //event to display to user
    event Log (uint _gas);

    //declaring fallback function
    fallback() external payable {
        //it is not recommended to write much code in here - because the function will fail if it uses too much gas

        //invoke send and transfer method: we get 2300 gas enough to emit a log
        //invoke the call method - we use all the gas

        //special solidity function - "gasleft" returns how much gas is left
        emit Log(gasleft());
    }

    function getBalance() public view returns(uint) {
        //return balance of the address that called the function
        return address(this).balance;
    }
}

// new contract will send ether to Fallback contract will trigger fallback function

contract SendToFallBack {
    
    function transferToFallBack(address payable _to) public payable {
        //send ether using transfer method

        //automatically transfer will transfer 2300 gas
        _to.transfer(msg.value); 
    } 

    function callFallBack(address payable _to) public payable {
        //send ether witll call method
        (bool sent,) = _to.call{value: msg.value}('');
        require(sent, 'Fail to send');
    }

}
