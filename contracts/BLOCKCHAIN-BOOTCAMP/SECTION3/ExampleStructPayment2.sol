//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.14;

contract Wallet2 {    
    /** Using struct saves on gas costs
    which also include very complex data structures */
    struct PaymentReceived {
        address from;
        uint amount;
    }

    PaymentReceived public payment;

    function payContract() public payable {
        payment = PaymentReceived(msg.sender, msg.value);
    }
}