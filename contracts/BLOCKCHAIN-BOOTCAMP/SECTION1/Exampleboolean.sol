//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract ExampleBoolean {
    bool public myBool;

    //getting boolean information
    function setBool(bool _fBool) public {
        myBool = _fBool;
    }
}
