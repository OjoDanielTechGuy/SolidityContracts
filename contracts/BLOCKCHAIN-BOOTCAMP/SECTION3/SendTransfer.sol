//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;
//Low-Level Solidity Calls In-Depth
//transfer or send performs the same function, 
contract Sender {
    /**
    - An Address has the property .balance which gives you the balance in wei
    - An Address has a function named .transfer(...) which lets you transfer from the contract 
    to the address an amount in wei

    ------------------------------
    Difference .send and .transfer
    ------------------------------
    - If the target address is a contract and the transfer fails, then (.transfer) will result in
    an exception and (.send) will simply return false, but the transaction won't fail
    */
    receive() external payable {} //fallback function
    
    function withdrawWithTransfer(address payable _to) public{
        _to.transfer(10);//it returns an error when it fails
    }

    function withdrawWithSend(address payable _to) public {
        _to.send(10); //it returns boolean when it fails
    }
}

contract ReceiveNoAction {
    
    function balance() public view returns(uint) {
        return address(this).balance;
    }

    receive() external payable{}
}

contract ReceiverAction {

    uint public balanceReceived;

    receive() external payable {
        balanceReceived += msg.value;
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }
}