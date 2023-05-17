// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

/*Mapping are an interesting datatype in Solidity. They are accessed like arrays, but they have one major advantage: 
All key/value pairs are initialized with their default value.*/

contract MappingExample {

/*In the codes below Onemaps uint256 to booleans, that's called myMapping. 
Another one that maps addresses to booleans, that we called myAddressMapping.
--

We can access a mapping with the brackets []. If we want to access the key "123" in our myMapping, 
then we'd simply write myMapping[123].

--

Our mappings here are public, so Solidity will automatically generate a getter-function

*/
    //mapping to set a uint value to boolean
    mapping(uint => bool) public myMapping;

    //mapping an address to boolean value
    mapping(address => bool) public myAddressMapping;

    //mappings of mappings
    mapping(uint => mapping(uint => bool)) uintUintBoolMapping;

    //set the value of a uint to true
    function setValue(uint _index) public {
        myMapping[_index] = true;
    }

    //set the address to true
    function setMyAddressToTrue() public {
        myAddressMapping[msg.sender] = true;
    }

    //setter function
    function setUintUintBoolMapping(uint _index1, uint _index2, bool _value) public {
        uintUintBoolMapping[_index1][_index2] = _value;
    }

    //getter function
    function getUintUintBoolMapping(uint _index1, uint _index2) public view returns(bool) {
        return uintUintBoolMapping[_index1][_index2];
    }

}