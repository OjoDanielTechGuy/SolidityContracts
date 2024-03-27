//SPDX-License-Identifier: MIT

pragma solidity >= 0.7.0 <= 0.9.0;

contract C {

    uint private data; //cannot be called outside of a contract

    uint public info; //can be called within and outside of contract

    //initializing info value to 10 upon deployment of contract
    constructor() {
        info = 10;
    }

    //function that cannot be called eternally 
    function increment(uint _a) private pure returns(uint){
        return _a += 1;

    }

    //function updateData which can be called anywhere
    function updateData(uint _a) public {
        data = _a;
    }

    //read only function to return value of data
    function getData() public view returns(uint) {
        return data;
    }

    //read only function to return 2 arguements
    function compute(uint _a, uint _b) internal pure returns(uint) {
        return _a + _b;
    }
}

contract D {

    C c = new C();

    //function to derive a contract via a new variable then return an element of the contract
    function readInfo() public view returns(uint) {
        return c.info();
    }
}

contract E is C {

    uint private result; //no calling outside of contract
    
    C private c; //private variable inheriting from C

    //constructor to set a new instance upon deployment of contract
    constructor() {
        c = new C();
    }

    //function that sets value to a function of contract inherited 
    function getComputedResult() public {

        result = compute(23, 5);
    }

    //function that return a result
    function getResult() public view returns(uint) {

        return result;
    }

    //function to return info value from inherited contract
    function returnInfo() public view returns(uint) {

        return info;
    }
}
