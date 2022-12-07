//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.13;

contract Mapping {
    //mapping address to uint
    mapping(address => uint) myMap;

    function get(address _addr) public view returns(uint) {
        return myMap[_addr];
    }

    function set(address _addr, uint _i) public {
        //updating value at this address
        myMap[_addr] = _i;
    }

    function remove(address _addr) public {
        //resetting to default value
        delete myMap[_addr];
    }
}

contract NestedMapping {
    //nested mapping(mapping from address to another mapping)
    mapping(address => mapping(uint => bool)) nested;

    function get(address _addr1, uint _i) public view returns (bool) {
        return nested[_addr1][_i];
    }

    function set(address _addr1, uint _i, bool _boo) public {
        nested[_addr1][_i] = _boo;
    }

    function remover(address _addr1, uint _i) public {
        delete nested[_addr1][_i];
    }
}