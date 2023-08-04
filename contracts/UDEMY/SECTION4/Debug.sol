// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract Debugging {
    string public name = "Daniel";

    uint public value;

    function setValue(uint _value) public {
        value = _value;
    }
}