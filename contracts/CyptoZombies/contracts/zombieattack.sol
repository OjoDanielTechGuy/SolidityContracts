// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import  "./zombiehelper.sol";
import "./safemath.sol";

contract ZombieAttack is ZombieHelper {

    using SafeMath for uint256;

    uint randNonce = 0;

    //probability of winning
    uint attackVictoryProbability = 70;


    //dealing with random number keccak256
    function randMod(uint _modulus) internal returns(uint) {
        //usin safemath
        // randNonce++;
        randNonce = randNonce.add(1);
        return uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, randNonce))) % _modulus;
    }

    //function attack
    function attack(uint _zombieId,uint _targetId) external onlyOwnerOf(_zombieId){
        //storage pointer to both zombies so we can more easily interact with them:
        Zombie storage myZombie = zombies[_zombieId];
        Zombie storage enemyZombie = zombies[_targetId];

        //random number to determine outcome of battle
        uint rand = randMod(100);

        //checking victory
        if(rand <= attackVictoryProbability) {
            myZombie.winCount = myZombie.winCount.add(1);
            // myZombie.winCount++;
            
            myZombie.level = myZombie.level.add(1);
            // myZombie.level++;

            enemyZombie.lossCount = enemyZombie.lossCount.add(1);
            // enemyZombie.lossCount++;

            feedAndMultiply(_zombieId, _targetId, "zombie");
        }
        else {
            myZombie.lossCount = myZombie.lossCount.add(1);
            // myZombie.lossCount++;

            enemyZombie.winCount = enemyZombie.winCount.add(1);
            // enemyZombie.winCount++;
            _triggerCoolDown(myZombie);
        }
    }
}