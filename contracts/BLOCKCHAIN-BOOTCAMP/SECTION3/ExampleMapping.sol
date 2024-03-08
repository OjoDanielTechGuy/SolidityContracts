//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.14;

contract ExampleMapping {
    /**They are accessed like arrays, 
    but they have one major advantage: 
    All key/value pairs are initialized with their default value.
    - Mappings are accessed like arrays, but there are no index-out-of-bounds-exceptions.
    */

    //using the public function automatically creates a getter function with same name

    mapping(uint => bool) public myMapping; //mapping uint(key) to bool(value)
    mapping(address => bool) public myAddressMapping; //mapping address(key) to bool(value)

    mapping(uint => mapping(uint => bool)) uintUintBoolMapping;

    function setValue(uint _index) public {
        myMapping[_index] = true;
    }

    //another way of setting your value
    function setMyAddressToTrue() public {
        myAddressMapping[msg.sender] = true; //msg.sender gets the sender address
    }

    function setUintBoolMapping(uint _index1, uint _index2, bool _value) public{
        uintUintBoolMapping[_index1][_index2] = _value;
    }

    function getUintUintBoolMapping(uint _index1, uint _index2) public view returns(bool) {
        return uintUintBoolMapping[_index1][_index2];
    }


}