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

//Looping practice
//1. Create a contract myLoopingPracticeContract and place the code within
//2. Create a list that ranges from 1 to 20 called longList
//3. Create a list called numbersList of the following numbers 1, 4, 34, 56
//4. Create a function that loops through numbersList and returns a true value if the number
// that the user inputs exists in the list otherwise it should return false
//5. Create a function that loops through and returns how many even numbers there are in the long list

contract myLoopingPracticeContract {

    //list that ranges from 1 to 20
    uint[] longList = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];

    //list called numbersList
    uint[] numbersList = [0,1,4,34,56];

    //function that loops through numbersList
    function loopNumbersList(uint _userInput) public view returns(bool) {        
        
        bool numberExists = false;
        
        //looping through
        for(uint i = 0; i < numbersList.length; i++) {
            
            //condition to return true if user inputs number in numbersList
            if(numbersList[i] == _userInput) {
                numberExists = true;
            }
        return numberExists;
        }
    }

    //function that loops through and return even numbers
    function returnEvenNumbers() public view returns(uint) {
        uint count; //to count number of even number in list

        //looping
        for (uint i = 0; i < longList.length; i++) {
            if(longList[i] % 2 == 0) {
                count++;
            }
        }
        return count;
    }
}
