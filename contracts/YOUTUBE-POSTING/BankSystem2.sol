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

contract BankingSystem {

    mapping(address => uint) public userAccount; //containing amount for each user registered

    //created for user restrictions to confirm if user exists
    mapping(address => bool) public userExists; 

    //owner variable to store address
    address public owner;

    //initialize owner of contract at start of smart contract
    constructor() {
        owner = msg.sender;
    }

    // address payable _userAddress; // needed to use for modifier

    //modifier to reuse in functions
    modifier onlyOwner{
        require(owner == msg.sender, "You are not the owner of contract");
        _;
    }

    //create account via the address input then use the features of the modifier
    function createAccount(address payable _userAddress) public payable onlyOwner returns(string memory) {

    // //making address inputted stored into the variable _userAddress            
    //     _userAddress = _actAddress;

      require(userExists[_userAddress] == false, "Account already created");
    //condition - when value sent is 0, hence account balance is 0, user exists in database
        if (msg.value == 0) {
            userAccount[_userAddress] = 0;
            userExists[_userAddress] = true;
            return "Account Created";
        }
    
    //when value sent is != 0,
    // require(userExists[_actAddress] == false, "Account Already Created");
        userAccount[_userAddress] = msg.value;
        userExists[_userAddress] = true;
        return "Account Created";
    }

    //deposit function - allowing only registered users to deposit
    function deposit(uint _amount, address payable _userAddress) public onlyOwner returns(string memory) {

        require(userExists[_userAddress] == true, "Account is not created");
        require(_amount > 0, "Value for deposit is Zero");
        userAccount[_userAddress] += _amount;

        return "Deposit Successful";
    }

    //withdraw function
    function withdraw(uint _amount, address payable _userAddress) public onlyOwner returns(string memory) {

        require(userExists[_userAddress] == true, "Account is not created");
        require(userAccount[_userAddress] > _amount, "Insufficient balance in account");
        require(_amount > 0, "Enter non-zero value for withdrawal");
        userAccount[_userAddress] -=  _amount;

        return "Withdrawal Successful";
    }

    /**transfer function - transfers amount from one account to other account in the bank only hence
    only both users must have created the account on the bank to use this function (same bank transfer)**/
    function transferAmount(address payable _transferAddress, uint _amount) public onlyOwner returns(string memory) {
        
        require(userExists[_transferAddress] == true, "Account is not created");
        require(userAccount[_transferAddress] > _amount, "Insufficient balance in account");
        
        require(userExists[_transferAddress] == true, "to Transfer account does not exists in bank accounts");
        require(_amount > 0, "Enter non-zero value for sending");

        userAccount[msg.sender] -= _amount;
        userAccount[_transferAddress] += _amount;

        return "Transfer Successful";
    }

    //Here the sender's amount will be transfered from account in the bank to other receiver's wallet
    function sendEther(address payable _toAddress, uint _amount) public payable onlyOwner returns(string memory) {

        require(_amount > 0, "Enter non-zero value for withdrawal");
        require(userExists[msg.sender] == true, "Account is not created");
        require(userAccount[msg.sender] > _amount, "Insufficient balance in Bank account");
        
        userAccount[msg.sender] -= _amount;
        _toAddress.transfer(_amount);
        
        return "Transfer Success";
    }

    //get balance function
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
}
