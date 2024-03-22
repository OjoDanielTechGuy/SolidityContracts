// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

/*
WITHDRAWAL PATTERN

Instead of using transfer which reverts the code we can use send which returns a bool

Write a function so only the owner can send Tosin funds with the send method with logic to set up
what happens if the amount is not sent to Tosin
*/

contract WithdrawPattern {

    string Tosin;
    uint amount;

    modifier onlyOwner() {
        _;
    }

    function sendRefund() public onlyOwner returns(bool success) {
        // if(!Tosin.send(amount)) {
            //do something with failure
    }

    //this is quite not a good function

/*
Write a withdrawal function so that the investor can withdraw funds on their own through that functionality.
Use - msg.sender
*/

    function withdraw(uint _amount) payable public {
        msg.value;
    }   

/*
Write a function to claim refunds. Write a function called claimRefund which requires that the balance of the msg.sender
greater than 0 and transfer the balance to the current caller. Pseudo balance var named balance
*/

    mapping (address => uint) public balance;

    function claimRefund() public payable {

        require(balance[msg.sender] > 0, "Amount lesser than 0");
        // msg.sender.transfer(balance[msg.sender]);
    }

/*
1.  Write a function called withdrawFunds that takes an amount and returns bool success in the signature
2. Require that the balance of the current caller is greater than or equal to the amount
3. Subtract the amount from the balance of the current sender
4. Transfer the amount over and return the trueness of the function
*/

    function withdrawFunds(uint _amount) public returns(bool) {
        require(balance[msg.sender] >= _amount, "Balance is lesser than amount specified");
        balance[msg.sender] -= _amount; // //optimistic accounting
        // msg.sender.transfer(msg.value); //transfer
        return true;
    }
}

 
