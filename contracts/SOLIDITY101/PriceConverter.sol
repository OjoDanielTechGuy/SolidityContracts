// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

//Importing chainlink as an Oracle to get real life data feeds
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    
    function getPrice() internal view returns(uint) {
        //Address: 0x694AA1769357215DE4FAC081bf1f309aDC325306 (Sepolia)
        //0x5B38Da6a701c568545dCfcB03FcB875f56beddC4 (RemixVM)
        //ABI

        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        // AggregatorV3Interface priceFeed = AggregatorV3Interface(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
        (, int256 price, , ,) = priceFeed.latestRoundData();
        //Price of ETH in reference to USD
        // 200.000000000
    
        //casting the price to uint
        return uint(price) * 1e10;
    }

    //converstion rate to determine the amount of USD to ETH
    function getConversionRate(uint _ethAmount) internal view returns(uint){

        uint ethPrice = getPrice();
        //1e18 = 1 ETH  
        uint ethAmountInUSD = (ethPrice * _ethAmount) / 1e18;
        return ethAmountInUSD;
    }

    function getVersion() internal view returns(uint) {
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
        // return AggregatorV3Interface(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2).version();
    }
}
