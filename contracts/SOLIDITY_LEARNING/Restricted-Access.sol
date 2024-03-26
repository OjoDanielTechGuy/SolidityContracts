//SPDX-License-Identifier: MIT

pragma solidity >= 0.7.0 < 0.9.0;

/*
Restricted Access
--
Restricted access to a contract is a common practice
-
By default, a contract is read only unless it specified as public
-
We can restrict who can modify the contract's state or call a contract function using modifiers
-
Let's build a contract with a modifier restricted access with the following common write ups:

-   OnlyBy - only the mentioned caller can call this function
*
-   OnlyAfter - called after a certain period
*
-   costs - call the function only if certain value is provided

*/

contract RestrictedAccess {

    address public owner = msg.sender;
    uint public creationTime = block.timestamp;

    //write a modifier called onlyBy that will require the current caller to be equal to an account address
    //which will be set as input in the modifier and if the requirement fails send a message that says
    // "Sender not Authorized!"

    modifier onlyBy(address _account) {
        require(msg.sender == _account, "Sender not Authorized");
        _;
    }    

    modifier onlyAfter(uint _time) {
        require(block.timestamp >= _time, "Function is called too early");
        _;
    }
    
    
    //function that will change the owner address
    function changeOwnerAddress(address _newAddress) public onlyBy(owner) {
        owner = _newAddress;
    }

    //a function that will disown the current owner
    //only run the function 1 weeks of 5 seconds after the creation of the contract

    function disown() public onlyBy(owner) onlyAfter(creationTime + 1 weeks) {
        delete owner;
    }

/*
Exercise:
-
1. Create a modifier called costs which takes an _amount parameter
2. Require that msg.value is greater than or equal to the amount
3. If the msg.value is not greater than or equal to the amount return a string that says Not enough Ether Provided
4. Write a function called forceOwnerChange which takes on address called _newOwner and is payable
5. Add a modification to the signature so that the function needs 200 ethers to execute
6. Set the owner of the contract to the new owner of the address 
*/

    modifier costs(uint _amount){
    
    require(msg.value >= _amount, "Not enough Ether Provided");
        _;
    }

    function forceOwnerChange(address _newOwner) payable public costs(200 ether) {
        owner = _newOwner;
    }
  
} 
