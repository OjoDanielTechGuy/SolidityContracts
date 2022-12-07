//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract ExampleWrapAround {
    /*uint8 ranges from 0 to 255.
    If you increment 255 it will automatically be 0, if you decrement 0, 
    it will become 255 if the operation is unchecked. No warnings, no errors. */

    uint8 public myUint8 = 250;

    function decrement() public {
        myUint8--;
    }

    function increment() public {
        myUint8++;
    }
    /*If you deploy this and run "increment" more than 5 time, 
    The problem is, those cases are actually pretty rare. Normally, 
    we don't want an integer to roll over. That's why in 0.8 it changed to be the default behavior to error out 
    if the maximum/minimum value is reached. 
    But you can still enforce this behavior. With an unchecked block
    the myUint8 will just magically start from 0 again. No warning.*/
}

contract ExampleWrapAround2 {
    
    uint256 public myUint;

    function decrementUintUnchecked() public {
        unchecked {
            myUint--;
        }
    }

    function decrementUint() public {
        myUint--;
    }

    //If you run decrementUintUnchecked it will go from 0 to the 2^256 - 1.
}