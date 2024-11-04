// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

//Lesson - 4
//1- Tokens on smart contract
//2- ERC721 token standard - Implementing a token contract
//3- BalanceOf and OwnerOf
//4 - Refractoring - (ownerOf to onlyOwnerOf)
//5 - ERC721: transfer logic
//6 - Transfer logic continuation
//7 - ERC721: Approve
//8 - fire Approval event from erc7
/** --
9 - preventing overflows - using safemath method
Introducing Safe Math library from OpenZeppelin
- The SafeMath library has 4 functions — add, sub, mul, and div.

First we have the library keyword — 
    libraries are similar to contracts but with a few differences. 
    For our purposes, libraries allow us to use the using keyword, 
    which automatically tacks on all of the library's methods to another data type:
**/


import "./zombieattack.sol";
import "./erc721.sol"; //2
import "./safemath.sol"; //9

//1

abstract contract ZombieOwnership is ZombieAttack,  ERC721  { 

    using SafeMath for uint256; //9


    //6, - making sure onlyOwner or approved address of a token can transfer it
    mapping(uint => address) zombieApprovals;

    //2 - implementing first 2 methods.

    function balanceOf(address _owner) external view override returns (uint256) {
        //return number of zombie
        return ownerZombieCount[_owner]; 
    }
    
    function ownerOf(uint256 _tokenId) external view override returns (address) {
        //return address of who owns the zombie
        return zombieToOwner[_tokenId];
    }

    //5, a function for a logic transfer
    function _transfer(address _from, address _to, uint _tokenId) private {
        // ownerZombieCount[_to]++; //increasing for the person receiving the zombie
        //9 -using safeMath method
        ownerZombieCount[_to] = ownerZombieCount[_to].add(1);
        
        //9 - ownerZombieCount[_from]--; //decreasing for the person sending the zombie
        ownerZombieCount[_from] = ownerZombieCount[_from].sub(1);

        zombieToOwner[_tokenId] = _to; //the token Id points to the receiver
        emit Transfer(_from, _to, _tokenId); //firing an event
    }

    //6, - 
    function transferFrom(address _from, address _to, uint256 _tokenId) external override payable {
        //require that only owner can transfer
        require(zombieApprovals[_tokenId] == msg.sender); // or (zombieToOwner[_tokenId] == msg.sender);

        //calling _transfer function
        _transfer(_from, _to, _tokenId);
    }

    //7 - add modifier onlyOwnerOf to ascertain only owner of contract can give approval
    function approve(address _approved, uint256 _tokenId) external override payable onlyOwnerOf(_tokenId) {
        zombieApprovals[_tokenId] = _approved; 
        emit Approval(msg.sender, _approved, _tokenId); //fire the event
    }
}  