//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;


contract ExampleMsgSender {

    address public someAddress;

    //function to get address of msg sender
    function updateSomeAddress() public {
        someAddress = msg.sender;
    }
}