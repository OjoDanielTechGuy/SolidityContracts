// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 < 0.9.0;
//functions - a group of code that can be executed many times


//pseudo thought code experiment
//door - variable (stored information)
//remoteControlOpen - open the door - function
//remoteControlClose - close the door - function

contract learnFunction{
    //function function-name(parameters-list) scope returns()
    // statements }

    function remoteControlOpen(bool closedDoor) public returns(bool) {
        //code here
    }

    //function that add up 2 sum
    function addUp() public pure returns(uint) {
        uint a = 2;
        uint b = 3;
        uint result = a+b;
        return result;
    }

//Exercise 1
//------
//1. Create a function called multiplyCalculator
//2. Add two parameters a and b and set them to integers
//3. Grant the function public visibility as well as view capacity
//4. Return an integer for the function
//5. Create a variable result that uses the logic of multiplication
//6. Return a result
//7. Compile and Deploy

    function multiplyCalculator(uint a, uint b) public view returns(uint) {
        uint result = a * b;
        return result;
    }
}