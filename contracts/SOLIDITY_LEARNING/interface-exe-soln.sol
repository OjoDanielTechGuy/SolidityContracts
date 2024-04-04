// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 <= 0.9.0;

/*
Interface Exercise: Interfaces with Uniswap (Decentralized Exchange)

In Uniswap, each Uniswap smart contract or pair, manages a liquidity pool made up of reserves of two ERC20 tokens
This exercise is to speak to Uniswap and get the reserves of a Uniswap pair.

1. Create two interfaces which each hold separate function signatures which you must look up in "Solidity docV2"
https://docs.uniswap.org/contracts/v2/reference/smart-contracts/pair
2. One interface will be called UniswapV2Factory which will contain the function signature that gets pairs
3. Another interface will be called UniswapV2Pair which contains the function signature to get reserves values
4. Create a contract which contains addresses of the paired tokens you choose as well as the factory address
5. Within the contract make a function which can successfully get the pair of your tokes and set it to an address
6. Use that address to get the reserve values and finally return the reserve values

*/

interface UniswapV2Factory {

/*
Returns the address of the pair for tokenA and tokenB, if it has been created, 
else address(0) (0x0000000000000000000000000000000000000000).
*/

    function getPair(address tokenA, address tokenB) external view returns(address pair);
}

interface UniswapV2Pair {
/*
Returns the reserves of token0 and token1 used to price trades and distribute liquidity. See Pricing. 
Also returns the block.timestamp (mod 2**32) of the last block during which an interaction occured for the pair.
*/
    function getReserves() external view returns(uint112 reserves0, uint112 reserves1, uint32 blockTimeStampLast);
}

contract MyContract {

/*
UniswapV2Factory is deployed at 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f on the Ethereum mainnet, 
and the Ropsten, Rinkeby, Görli, and Kovan testnets. It was built from commit 8160750.
*/

    address private factory = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
    address private dai = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address private weth = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;

    function getReservesToken() external view returns(uint, uint) {
        address pair = UniswapV2Factory(factory).getPair(dai, weth);
        (uint reserve0, uint reserve1,) = UniswapV2Pair(pair).getReserves();
        return(reserve0, reserve1);
    }
}
