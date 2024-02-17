// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

//Looping: loops allows you to iterate through data and take a functional action on the data
//For Loop is used to repeat a specific number of block 

contract loopContract {
    //an array list of number ranging from  1 to 10
    uint [] public numbersList = [1,2,3,4,5,6,7,8,9,10];

    //A loop that acts as a multiple checker in our numbersList

    function checkMultiples(uint _number) public view returns(uint) {
        uint count = 0;
        //3 part statement of a for loop
        //1. initiate start of loop
        //2. determine the length of loop
        //3. to direct the index after each turn
        for (uint i = 1; i < numbersList.length; i++) {
            //logic for the loop
            if (checkMultipleValidity(numbersList[i], _number)) {
                count++;
            }
        }
        return count;
    }

    //creating a function that can check if two numbers are divisible by each other 
    //- or they are multiples of each other

    function checkMultipleValidity(uint _num, uint _nums) public view returns (bool) {
            //module operator = % the remainder value of R from integers
            //take two numbers and if they return modulo of zero then the sec number is a multiple of first   
            if(_num % _nums == 0) {
                return true;
            } else {
                return false;
            }
    }

}
