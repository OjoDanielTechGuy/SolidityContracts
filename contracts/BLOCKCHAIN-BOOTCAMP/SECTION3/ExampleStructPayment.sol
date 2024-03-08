//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.14;

contract PaymentReceived {
    address public from;
    uint public amount;

    constructor(address _from, uint _amount) {
        from = _from;
        amount = _amount;
    }
}

contract Wallet {
    PaymentReceived public payment;

    function payContract() public payable {
        payment = new PaymentReceived(msg.sender, msg.value);
    }
}

/**with Solditiy you are facing the challenge of limited resources using the code above
Let's change the Smart Contract above to use a struct instead (check ExampleStructPayment2). 
A struct is a way to generate a new DataType**/


