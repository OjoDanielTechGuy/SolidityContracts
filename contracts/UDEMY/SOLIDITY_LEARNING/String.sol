//SPDX-License-Identifier: MIT

pragma solidity  > 0.7.0 <= 0.8.22;

contract TestingStrings {

    string public name;

    function changeName(string memory _name) public returns(string memory) {
        name = _name;
        return name;
    }
    
    
    //getName
    function getName() public view returns(string memory){
        return name;
    }

    //length of string
    function getLengthofString() public view returns (uint){
        bytes memory stringLength = bytes(name);
        return stringLength.length;
    }


}

