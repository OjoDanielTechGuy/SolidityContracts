// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

/*
Your assignment is to build out the contract functionality ("allowance" serves as name of nested mapping). 

Create a Contract, using nested mapping, to pair two contract addresses together 
(an address owner and an address spender) with a value of integers to keep track of their index.

One you have successfully set up the map, add additional contract functionality so that the contract 
can pair up new addresses together (owner and spender) as well as retrieve their mapping value.
*/

contract nestedMappings {

    mapping(address => mapping(address => uint)) private allowance;

    //function to pair two address with a value
    //setAllowance - allows the contract owner to set up or update the allowance for a spender address
    function setAllowance(address _addrOwner, address _addrSpender, uint _id) public {
        allowance[_addrOwner][_addrSpender] = _id;
    }

    //function to retrieve the mapping value for a given owner and spender
    //getAllowance - allows anyone to retrieve the allowance value for a given owner and spender 
    function getAllowance(address _addrOwner, address _addrSpender) public view returns(uint) {
        return allowance[_addrOwner][_addrSpender];
    }

    //function to pair new address together
    //pairAddresses - a helper function that calls setAllowance to pair a new address together
    function pairAddresses(address _addrOwner, address _addrSpender, uint _id) public {
        setAllowance(_addrOwner, _addrSpender, _id);
    }

    //function to remove allowance spender
    function remove(address _addrOwner, address _addrSpender) public {
        delete allowance[_addrOwner][_addrSpender];
    } 
}
