//SPDX-License-Identifier: MIT

/*
Constructor is a special function using "constructor" keyword.
It initializes state variables of a contract

Following are key characteristics:

    1. A contract can only have one constructor

    2. A constructor code is executed once when a contract is created and it is used to initialize a contract

    3. After a constructor code is executed, the final code is deployed to the blockchain.
    This code includes public functions and codes reacheable through public functions.
    Constructor code or any internal method used only by constructor are not included in final code.

    A constructor can either be public or private.

    A internal constructor markes the contract as abstract.

    In case, no constructor is defined, a default constructor is present in the contract.

*/

pragma solidity >=0.7.0 <0.9.0;

contract Member {
    //declaring state variables
    string name;
    uint256 age;

    //initialize name upon deployment
    constructor(string memory _name, uint256 _age) public {
        name = _name;
        age = _age;
    }
}

//option to call the constructor from the contract by inheriting
contract Lecturer is
    Member //("Lawal", 35)
{
    constructor(string memory _n, uint256 _a) public Member(_n, _a) {}

    function getname() public view returns (string memory) {
        return name;
    }
}

/*
Exercise for Constructors
1. Create a contract called Base which stores fully accessible (inside and outside) integer data upon deployment
2. Create another contract called Derived which derives the data from base and runs a function that always output
the data to the number 5
*/

contract Base {
    //declaring state variables
    uint data;

    constructor(uint _data) public {
        data = _data;
    }

    function getData() public view returns(uint) {
        return data;
    }
}

contract Derived is Base (5) {//hard coding 5 into the contract

    function getBaseData() public view returns(uint) {
        return data;
    }
}
