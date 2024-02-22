//SPDX-License-Identifier: MIT

//licensing right of smart contract above
//CREATING YOUR OWN TOKEN ON BINANCE (BINANCE SMART CHAIN)
pragma solidity ^0.8.21; //solidity compiler version

//importing ERC20 token - it allows you to all functionalities in ERC20 token
import "@openzeppelin/contracts/token/ERC20/ERC20.sol"; 

/**
OpenZeppelin is an open-source framework that helps build secure smart contracts. 
It provides variety of smart contracts, tokens and multiple other functionalities.
*/

//making custom ERC20 token
contract BinanceToken is ERC20 { //initializing contract and inheriting from ERC20

    //create a constructor
    constructor() ERC20("BinanceCoin", "BCToken") {

/**
 The _mint function comes from ERC20 token. 
 It's all about minting tokens and giving them to the person who deployed the contract 
 (that's you, msg.sender). - The calculation is simply how many tokens to be made
*/

        //miniting token
        _mint(msg.sender, 100 * 10 ** ERC20.decimals()); //name of token, symbol of token
    }


}
