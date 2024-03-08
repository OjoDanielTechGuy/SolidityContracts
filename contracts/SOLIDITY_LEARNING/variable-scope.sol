// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/*
VARIABLE SCOPE - functions and variables
----
Private: function can only be called inside the contract
Internal: can be called only within the contract and any other contract inherting 
        from the smart contract, Internal is slightly less restrictive than public
Public: function can be called outside the contract and inside 
External: you can call the function outside of the contract but not from the function within  

//Rules of Scope
1. private 2. internal 3. public 4. external

//State Variable vs Local Variable
*/
contract VariableScope {

    uint internal data = 10;//state variable

    function x() external  pure returns(uint) {
        uint newData = 25;
        return newData;
    }

    function y() public view returns(uint) {
        return data;
    }



}