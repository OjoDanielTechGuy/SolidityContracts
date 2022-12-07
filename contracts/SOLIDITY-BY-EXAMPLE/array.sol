//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.13;

contract Array {
    //initaiting Array
    uint[] arr;
    uint[] arr2 = [1,2,3];

    //fixed size Array
    uint[10] myFixedSizeArr;

    function get(uint i) public view returns(uint) {
        return arr[i];
    }      

    //returning entire array
    function getArr() public view returns(uint[] memory){
        return arr;
    }

    //appending to an arr
    function push(uint i) public {
        arr.push(i);
    }

    //removing last element
    function pop() public {
        arr.pop();
    }

    //getting the length
    function getLength() public view returns(uint) {
        return arr.length;
    }

    //removing array
    function remove(uint index) public {
        delete arr[index];
    }

    //creating array in memory
    function examples() external{
    uint[] memory a = new uint[](5);
    }
}