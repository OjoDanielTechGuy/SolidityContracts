//SPDX-License-Identifier: MIT

//using open zeppelin contracts code for access mode
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

pragma solidity ^0.8.18;

contract Allowance is Ownable {

    //adding events to the contract to listen to the blockchain
    event AllowanceChanged(address indexed _forWho, address indexed _fromWhom, uint _oldAmount, uint _newAmount);

    mapping(address => uint) public allowance;

    function addAllowance(address _who, uint _amount) public onlyOwner {

        emit AllowanceChanged(_who, msg.sender, allowance[_who], _amount);
        allowance[_who] = _amount;
    }
    
    modifier ownerOrAllowed(uint _amount) {
        require(isOwner() || allowance[msg.sender] >= _amount, "You are not allowed");
        _;
    }
    
    //reducing allowance  functionality needed to withdraw
    function reduceAllowance(address _who, uint _amount) internal {
        emit AllowanceChanged(_who, msg.sender, allowance[_who], allowance[_who] - _amount);
        allowance[_who] -= _amount;
    }
}

contract SharedWallet is Allowance {
    
    function withdrawMoney(address payable _to, uint _amount) public ownerOrAllowed(_amount) {

        require(_amount <= address(this).balance, "There are not enough funds stored in the smart contract");

        if(!isOwner()) {
            reduceAllowane(msg.sender, _amount);
        }

        _to.transfer(_amount);
    }

    receive() external payable {}
}
