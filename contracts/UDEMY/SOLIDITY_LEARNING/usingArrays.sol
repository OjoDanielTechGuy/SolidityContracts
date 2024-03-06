// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 > 0.8.0;

/*
ARRAY: Array is a data structure, which stores fixed-size sequential collection of elements of the same type.
An array is used to store collection of data.
but it is often more useful to think of an array as a collection of variables of the same type.

//1. How to write an array
//2. pop, push and length methods
//3. remove elements from array
*/

contract usingArrays {

    uint[] public myArray;
    uint[] public myArray2;
    uint[200] public myFixedSizeArray;

    //The push() methods adds one or more elements to the array and returns new length of the array

    function push(uint _number) public {
        myArray.push(_number);
    }

    //The pop method removes the last element from the array
    function pop() public {
        myArray.pop();
    }

    //length is the string property that is used to determine the length of the string
    function getLength() public view returns(uint) {
        return myArray.length;
    }

    function remove(uint _i) public (){
        delete myArray[_i];
    //when you delete in the array, the length remains the same

     //Exercise create a function that can fully remove an item from an array
    //1. //*REMOVE ELEMENT // * PRESERVE INTEGRITY

    //1. Create an empty array called changeArray;
    uint[] public changeArray;

    //2. Create a function called removeElement which sets the index arguement of the array to the last element 
    //in the array
    //3. remove the last index from that function with the pop method
    //4. remove the element 2 from the array when contract is called
    function removeElement(uint _i) public {
        changeArray[_i] =  changeArray[changeArray.length - 1];
        changeArray.pop();
    }

    //5. create a function called test which pushes 1 2 3 4 into changeArray
    
    function test() public {

        /* 
        changeArray.push(1);
        changeArray.push(2);
        changeArray.push(3);
        changeArray.push(4);
        */

        //using for to push into changeArray
        for(uint i = 1; i <= 4; i++) {
            changeArray.push(i);
        }    
    }


    //printing all array element
    function getAllElements() public view returns(uint[] memory) {
        return changeArray;
    }

    }
}
