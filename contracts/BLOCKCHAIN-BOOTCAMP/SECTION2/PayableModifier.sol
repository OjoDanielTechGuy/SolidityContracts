//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract PayableModifier {
    
    //THE PAYABLE MODIFIER - TO CHARGE 1 ETHER FOR EVERY STRING CHANGE
    
    /**The payable modifier tells solidity that the function is expecting eth 
    to receive */

    string public myString = "Hello World";

    /**
    In order for it to receive Eth, you need to add two things here:
    - you need to add the payable modifier. That is the keyword "payable" right 
    next to the visibility specifier "public"
    - you need to understand the global msg-objects property called value. msg.value.
    -
    The msg-object contains information about the current message with the smart contract. 
    It's a global variable that can be accessed in every function.
    */

    function updateString(string memory _newString) public payable {
        if(msg.value == 1 ether) {
            myString = _newString;
        }
        else {
            payable(msg.sender).transfer(msg.value);
        }
        
    }
}