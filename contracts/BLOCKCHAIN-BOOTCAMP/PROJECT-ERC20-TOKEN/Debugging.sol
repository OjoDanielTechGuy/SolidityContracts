//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.14;

//install debugger plugin to use the debugging tool
contract DebuggingSample {

    uint public myUint = 123;

    function setMyUint(uint newUint) public {
        myUint = newUint;
    }
}