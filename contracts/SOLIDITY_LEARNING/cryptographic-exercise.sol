// Exercise (Secure the Random Functionality From Miner Manipulation): 

// 1. Create a contract Oracle with an address datatype called admin and a public integer called rand. 
// 2. Create a constructor and set the admin to the current caller. 
// 3. Write a function which takes the input of an integer and sets the state variable rand to that integer. 
// 4. Require that the current caller must equal the admin.
// 5. Set the oracle contract to a new variable called oracle in the GenerateRandomNumber contract (hint calling contracts)
// 6. Write a constructor in the GenerateRandomNumber contract which sets the oracle to a deployment address of the Oracle 
// 7. Modify the hash return so that the miners greatly lesson control manipulation to the random generation. 
// 8. Successfully deploy and test the results. 

//


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

// Oralce dynamic feeds 
//1.
contract Oracle {

    address admin;
    uint public rand;

//2.
    constructor() {
        admin = msg.sender;
    }

//3.
    function setRand(uint _rand) public {
       //4.
        require(msg.sender == admin, "You are not the caller");
        rand = _rand;
    }

}

contract GenerateRandomNumber {

    Oracle oracle; //5.

    //6.
    constructor(address _oracleAddress) {
        oracle = Oracle(_oracleAddress);
    }

    // Build a random number generator which takes an input range and uses cryptographic hashing 
    // modulo (%) - so by computing against the remainder we will be able to produce a random number within a range 
    // cryptographic hashing 

    function randMod(uint range) external view returns(uint) {
        // grab information from the blockchain randomly to generate random numbers - we need something dynamically changing
        // abi.encodePacked concatonates arguments nicely 
        return uint(keccak256(abi.encodePacked(oracle.rand, block.timestamp, block.difficulty, msg.sender))) % range;
    }

}
