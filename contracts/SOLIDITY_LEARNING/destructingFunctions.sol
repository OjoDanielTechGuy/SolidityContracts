// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

//Destructuring functions in Solidity - How to return multiple variables

contract DestructingFunction {

    //Solidity can return multiple variable of different types 
    //If you want to declare variable as return type, then declare it and use commas for separation

    uint public changeValue;
    bool public code;
    string public name = 'Daniel';

    //this function returns many variable by inputting in the exact value needed
    function manyReturn() public pure returns(uint, bool, string memory) {
        return(3, false, 'Practice');
    }

    //destructing - assigning values to manyReturn function returns
    function assignValue() public {
        (changeValue,code,name) = manyReturn();
    }

    //assigning only one value to the variable name which to takes manyReturn funtion
    function assignOneValue() public {
        (,,name) = manyReturn();
    }
}
