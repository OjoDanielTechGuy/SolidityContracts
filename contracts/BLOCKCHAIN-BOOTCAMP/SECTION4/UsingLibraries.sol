// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

//importing Open Zepplin libraries for safemath for overflow flag

// import "https://github.com/OpenZepplin/openzepplin-contracts/contracts/math/SafeMath.sol";

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";

contract Libraries {

    using SafeMath for uint;

    mapping (address => uint) public tokenBalance;

    constructor() {
        // tokenBalance[msg.sender] += 1;
        tokenBalance[msg.sender] = tokenBalance[msg.sender].add(1); //using a function in openzepplin (add)
    }

    function sendToken(address _to, uint _amount) public returns (bool) {

        // tokenBalance[msg.sender] -= _amount;
        tokenBalance[msg.sender] = tokenBalance[msg.sender].sub(_amount); //using a function in openzepplin (sub)
    
        // tokenBalance[_to] += _amount;
        tokenBalance[_to] = tokenBalance[_to].add(_amount); //using a function in openzepplin (add)
        
        return true;
    }
}