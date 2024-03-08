//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

/**In the previous lecture contract(ERC20Token.sol) we already implemented an ERC20 token. 
* But somehow, we can either mint it for someone, but nobody can obtain those tokens otherwise.
*
=============================
* In the previous contract (ERC20Token.sol), token sale was integrated directly but in 
* - this contract we will let another contract take control of some of the tokens through 
* - an allowance functionality.
*/

interface IERC20 {
    function transfer(address _to, uint _amount) external;
    function decimals() external view returns(uint);
}

contract ERC20TokenSale {

    uint public tokenPriceInWei = 1 ether;

    IERC20 public token;
    address public tokenOwner;

    constructor(address _token) {
        tokenOwner = msg.sender;
        token = IERC20(_token);        
    }

    function purchaseCoffee() public payable {
        require(msg.value >= tokenPriceInWei, "Not enough money sent");
        uint tokensToTransfer = msg.value / tokenPriceInWei;
        uint remainder = msg.value - tokensToTransfer * tokenPriceInWei;
        token.transfer(msg.sender, tokensToTransfer * 10 **token.decimals());
        payable(msg.sender).transfer(remainder);
    }

    //Convert to ether - web3.utils.toWei("5", "ether");

}