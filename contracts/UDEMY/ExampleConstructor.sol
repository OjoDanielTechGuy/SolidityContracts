//SPDX-License-Identifier: MIT



pragma solidity 0.8.15;

/*The constructor is a special function. 
*It is automatically called during Smart Contract deployment. 
And it can never be called again after that.
*It also has a special name! It's simply called constructor() { ... }.*/

contract ExampleConstructor {

    address public myAddress;

    constructor(address _someAddress) {
        myAddress = _someAddress;
    }

    function setMyAddress(address _myAddress) public {
        myAddress = _myAddress;
    }

    function setMyAddressToMsgSender() public {
            myAddress = msg.sender;

    }
}


