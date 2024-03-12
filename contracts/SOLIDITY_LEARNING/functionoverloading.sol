// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/*Function Overloading 
- you can have multiple function name but with different arguement
- the definition of the function must differ from each other by the types or number of arguement in the arguement list
- you cannot overload function declarations that differ only by return type
*/

contract OverLoadingFunction {

    function x(uint _lightSwitch, uint _wallet) public {

    }

    //same function name as above but different types of arguement
    function x(uint _wallet) public {

    }

//Exercise: 
//1. create two function with the same name that return the sum of their arguements -
// one function which takes two arguement and another function which takes three arguement.

//create other two function which can call each sum function and return their various sums
//deploy your contract and test the results

//1.
    function getSum(uint _a, uint _b) private pure returns(uint){
     return _a + _b;
    }

    function getSum(uint _a, uint _b, uint _c) private pure returns(uint) {
        return _a + _b + _c;
    }

//2.
    function getSumTwoArgs(uint _a, uint _b) public pure returns(uint) {
        return getSum(_a, _b);
    }

    function getSumThreeArgs(uint _a, uint _b, uint _c) public pure returns(uint) {
        return getSum(_a, _b, _c);
    }
    
}
