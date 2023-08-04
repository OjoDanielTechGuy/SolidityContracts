//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.19;

//using the interface for ERC20 Token
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

/*
How to swap tokens
-
1. Dan has 100 tokens from Dancoin, which is a ERC20 token.
2. Ayo has 100 tokens from AyoCoin, which is also a ERC20 token.
3. Dan and Ayo wants to trade 10 DanCoin for 20 AyoCoin.
4. Dan or Ayo deploy a transaction.
5. Dan approves TokenSwap to withdraw 10 tokens from AliceCoin.
6. Ayo approves TokenSwap to withdraw 20 tokens from DanCoin.
7. Dan or Ayo calls TokenSwap.swap()
8. Dan and Ayo traded tokens successfully
*/
contract TokenSwap {

    IERC20 public token1;
    IERC20 public token2;
    address public owner1;
    address public owner2;
    uint public amount1;
    uint public amount2;

    constructor ( address _token1, address _token2, address _owner1, address _owner2,
        uint _amount1, uint _amount2)
        {
            token1 = IERC20(_token1);
            token2 = IERC20(_token2);
            owner1 = _owner1;
            owner2 =_owner2;
            amount1 = _amount1;
            amount2 = _amount2;

        }

    function swap() public {

        require(msg.sender == owner1 || msg.sender == owner2, "Not authorized");
        require(token1.allowance(owner1, address(this)) >= amount1, "Token 2 allowance too low");

        _safeTransferFrom(token1, owner1, owner2, amount1);
        _safeTransferFrom(token2, owner2, owner1, amount2);
    }

    function _safeTransferFrom(IERC20 token, address sender, address recipient, uint amount) private {

        bool sent = token.transferFrom(sender, recipient, amount);
        require(sent, "Token transfer failed");
    }

}