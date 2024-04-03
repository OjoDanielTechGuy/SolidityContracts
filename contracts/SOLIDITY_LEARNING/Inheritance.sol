// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 <= 0.9.0;

/* -- Inheritance --
--
Inheritance is a way to extend the functionality of a contract 
Solidty supports both single as well as multiple inheritance
--
Classes can inherit so can contracts

Exercise: Create two contract A and B
1.  Contract A should have a state variable called innerVal initialized to 100
2.  Create a fully accessible function called innerAddTen which returns 10 to any given input 
3.  Contract B should inherit from Contract A
4.  Contract B should have a function called outerAddTen which returns the calculation from the
    innerAddTen function in Contract A to any given input
5.  Create a function in Contract B which returns the value innerValue from Contract A
6.  Compile and Deploy the contract then test the results

*/

contract A {

    uint innerVal = 100;

    function innerAddTen(uint _n) public pure returns(uint) {
        return 10 + _n;
    }
}

contract B is A {

    function outerAddTen(uint _b) public pure returns(uint) {
        return A.innerAddTen(_b); 
    }

    function returnVal() public view returns(uint) {
        return A.innerVal;
    }
}
