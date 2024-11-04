// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "./zombiefeeding.sol";

//inheriting from contract zombiefeeding
contract ZombieHelper is  ZombieFeeding {

    using SafeMath for uint256;
    using SafeMath32 for uint32;

    //declaring payable modifier
    uint levelUpFee = 0.001 ether;


    //function modifier with arguements
    modifier aboveLevel(uint _level, uint _zombieId) {
        require(zombies[_zombieId].level >= _level);
        _;
    }

    //withdraw function
    function withdraw() external onlyOwner() {
        address payable _owner = payable (owner()); //updated version of making address payable
        _owner.transfer(address(this).balance);
    }

    //setting levelup fee due to cost of eth
    function setLevelUpFee(uint _fee) external view onlyOwner() {
        levelUpFee == _fee;
    }

    function levelUp(uint _zombieId) external payable {
        require(msg.value == levelUpFee);
        //using SafeMath method
        // zombies[_zombieId].level++;
        zombies[_zombieId].level = zombies[_zombieId].level.add(1);
    }

    //zombie Modifier
    function changeName(uint _zombieId, string calldata _newName) external aboveLevel(2, _zombieId) onlyOwnerOf(_zombieId) {
        require(msg.sender == zombieToOwner[_zombieId]);
        //set
        zombies[_zombieId].name = _newName;
    } 

    function changeDna(uint _zombieId, uint _newDna) external aboveLevel(20, _zombieId) onlyOwnerOf(_zombieId){
        zombies[_zombieId].dna = _newDna;
    }

    //Saving Gas with View Function
    function getZombiesByOwner(address _owner) external view returns(uint[] memory) {
        //returning uint array of zombies
        uint[] memory result = new uint[](ownerZombieCount[_owner]);

        //For Loops declaration to iterates through all zombies
        uint counter = 0; //to keep of the index result

        for(uint i = 0; i < zombies.length; i++) {
            if(zombieToOwner[i] == _owner) {
                result[counter] = i;
                // counter++;
                counter = counter.add(1);
            }
        }

        return result;
    }

}