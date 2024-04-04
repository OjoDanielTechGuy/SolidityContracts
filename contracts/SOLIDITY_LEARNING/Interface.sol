// SPDX-License-Identifier: MIT

pragma solidity >= 0.7.0 <= 0.9.0;

/*
INTERFACES - Interfaces are similar to abstract contracts and are created using the "interface" keyword

Main Characteristics of Interface:

1.  Interface cannot have any function with implementation

2.  Function of interface can only be of type external

3.  Interface cannot have a constructor

4. Interface cannot have state variable

5. Interface can have enum, structs which can be assessed using interface name dot notation
*/

contract Counter {

    uint public count;

    function increment() external {
        count += 1;
    }
}

//how do we interact with this contract without copy and pasting code?? WE USE INTERFACE

interface ICounter {

    function count() external view returns(uint);
    function increment() external;
}

contract MyContract {

    function incrementCounter(address _counter) external {
        ICounter(_counter).increment();
    }

    function getCount(address _counter) external view returns(uint) {
        return ICounter(_counter).count();
    }
}
