//smart contract to demonstrate random numbers in specific range and non specific range using keccak256

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract RandomNumber {
    uint randNounce = 0;

    //function to generate random number within specific range
    function randNum(uint _modulus) external returns(uint) {
        //increasing nounce
        randNounce++;
        return uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, randNounce))) % _modulus;
    }

    //function to generate random number in non specific range
    function randNum2() external returns(uint) {
        //increasing nounce
        randNounce++;

        return uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, randNounce)));
    }


}