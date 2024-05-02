// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "./SimpleStorage.sol";

contract StorageFactory {

    //this stores the address of storage contract created
    SimpleStorage[] public listOfSimpleStorageContracts;

    function createSimpleStorageContract() public {
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }

    //function to store index and display number associated with it
    function sfStore(uint _simpleStorageIndex, uint _newSimpleStorageNumber) public {
        //Address
        //ABI
        
        // SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        // mySimpleStorage.store(_newSimpleStorageNumber);

        listOfSimpleStorageContracts[_simpleStorageIndex].store(_newSimpleStorageNumber);
    }

    //function to get the value stored via Index
    function sfGet(uint _simpleStorageIndex) public view returns(uint) {
        return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
    }

}
