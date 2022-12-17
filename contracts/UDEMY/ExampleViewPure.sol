//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract ExampleViewPure {

    uint public myStorageVariable;

    //VIEW FUNCTION
    /**
    A view function is a function that reads from the state but doesn't write to the state*/
    function getMyStorageVariable() public view returns(uint) {
        return myStorageVariable;
    }

    //PURE FUNCTION
    /**
    A pure function is a function that neither writes, nor reads from state variables*/
     function getAddition(uint a, uint b) public pure returns(uint) {
        return a+b;
    }

    function setMyStorageVariable(uint _newVar) public returns(uint) {
        myStorageVariable = _newVar;
        return _newVar;
    }


}