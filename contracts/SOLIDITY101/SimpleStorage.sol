
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

contract SimpleStorage {
    
    //favouriteNumber initializes to 0
    uint favouriteNumber;

    struct Person {
        uint favouriteNumber;
        string name;
    }

    //dynamic array
    Person[] public listOfPeople;

    //mapping
    mapping(string => uint) public nameToFavouriteNumber;

    function store(uint _favouriteNumber) public {
        favouriteNumber = _favouriteNumber;
    }

    //view, pure
    function retrieve() public view returns(uint) {
        return favouriteNumber;
    }

    //adding people via array
    function addPerson(string memory _name, uint _favouriteNumber) public {
        listOfPeople.push(Person(_favouriteNumber, _name));
        nameToFavouriteNumber[_name] = _favouriteNumber; 
    }
}
