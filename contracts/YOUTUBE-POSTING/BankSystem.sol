/**Basic Banking Smart Contract
-
-   Account creation
-   Deposit money
-   Withdraw money
-   Transfer money
-   Send money to wallet
**/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract BasicBankingSys{

    mapping(address => uint) public userAccount; //containing amount for each user registered
    mapping(address => bool) public userExists; //created for user restrictions

    //create account
    function createAccount() public payable returns(string memory) {

        require(userExists[msg.sender] == false, "Account Already Created");

        if(msg.value == 0) {
            userAccount[msg.sender] = 0;
            userExists[msg.sender] = true;
            return "Account Created";
        }

        require(userExists[msg.sender] == false, "Account Already Created");
        userAccount[msg.sender] = msg.value;
        userExists[msg.sender] = true;
        return "Account Created";
    }

    //deposit function - allowing only registered users to deposit
    function deposit(uint _amount) public payable returns(string memory) {

        require(userExists[msg.sender] == true, "Account is not created");
        require(_amount > 0, "Value for deposit is Zero");
        userAccount[msg.sender] = userAccount[msg.sender]+msg.value;

        return "Deposited Successfully";
    }

    //withdraw function
    function withdraw(uint _amount) public payable returns(string memory) {
        require(userAccount[msg.sender] > _amount, "Insufficient balance in account");
        require(userExists[msg.sender] == true, "Account is not created");
        require(_amount > 0, "Enter non-zero value for withdrawal");
        userAccount[msg.sender] -=  _amount;
        return "Withdrawal Successful";
    }

    /**transfer function - transfers amount from one account to other account in the bank only hence
    only both users must have created the account on the bank to use this function (same bank transfer)**/
    function transferAmount(address payable _userAddress, uint _amount) public returns(string memory) {
        require(userAccount[msg.sender] > _amount, "Insufficient balance in account");
        require(userExists[msg.sender] == true, "Account is not created");
        require(userExists[_userAddress] == true, "to Transfer account does not exists in bank accounts");
        require(_amount > 0, "Enter non-zero value for sending");

        userAccount[msg.sender] -= _amount;
        userAccount[_userAddress] += _amount;

        return "Transfer Successful";
    }

    //Here the sender's amount will be transfered from account in the bank to other receiver's wallet
    function sendEther(address payable _toAddress, uint _amount) public payable returns(string memory) {
        require(_amount > 0, "Enter non-zero value for withdrawal");
        require(userExists[msg.sender] == true, "Account is not created");
        require(userAccount[msg.sender] > _amount, "Insufficient balance in Bank account");
        
        userAccount[msg.sender] -= _amount;
        _toAddress.transfer(_amount);
        
        return "Transfer Success";
    }
}
