//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract ExampleAddress {
    //In general, a variable of the type address holds 20 bytes
    address public someAddress;

    function setSomeAddress(address _someAddress) public {
        someAddress = _someAddress;
    }

//get Balance of Address
    function getAddressBalance() public view returns(uint) {
        return someAddress.balance; //.balance is an in built funtion to get the balance of an Address
        /*Wei is the smallest, Ether = 10^18 Wei.
        Unit	Wei-Exp	Wei
        wei	    1	    1
        Kwei	10^3	1,000
        Mwei	10^6	1,000,000
        Gwei	10^9	1,000,000,000
        Ether	10^18	1,000,000,000,000,000,000*/
    }
    
}