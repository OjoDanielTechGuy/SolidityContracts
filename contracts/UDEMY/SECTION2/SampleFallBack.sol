//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.15;


/**Fallback Functions: receive Ether
- to send a plain eth transaction to a smart contract it will be 
through the receive function and/or through the fallback function.
*/
contract SampleFallBack {

    /**
    receive() is a function that gets priority over fallback() when a calldata is empty.
    But fallback gets precedence over receive when calldata does not fit a valid function signature.
    */

    uint public lastValueSent;
    string public lastFunctionCalled;

    /**erro: Both 'receive' and 'fallback' functions are not defined 
    when sending a low level intereations**/

    //THE RECEIVE FUNCTION -  it records the value sent and the function string:
    receive() external payable {
        lastValueSent = msg.value;
        lastFunctionCalled = "receive";
    }

    //THE FALL BACK FUNCTION
    fallback() external payable {
        lastValueSent = msg.value;
        lastFunctionCalled = "fallback";
    }
}