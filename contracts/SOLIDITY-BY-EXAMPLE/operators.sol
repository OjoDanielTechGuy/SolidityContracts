//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.12;

contract ArithmeticOperators {
    
    //initailizing variables
    uint16 public x = 40;
    uint16 public y = 30;

    //initializing with sum
    uint public sum = x + y;
    
    //differences
    uint public minus = x - y;

    //multiply
    uint public multiply = x * y;

    //division
    uint public div = x/y;
}

contract ComparisonOperators {

    uint16 public a = 20;
    uint16 public b = 10;

    bool public equal = a == b; //equal to

    bool public notEqual = a != b; //not equal to


}