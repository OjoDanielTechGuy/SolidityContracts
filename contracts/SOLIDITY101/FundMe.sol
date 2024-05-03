// SPDX-License-Identifier: MIT

//Get funds from user
//Withdraw funds
//Set a minimum funding value in USD

//importing PriceConverter
import "./PriceConverter.sol";

pragma solidity ^0.8.21;

contract FundMe {
    using PriceConverter for uint;

    uint minimumUSD = 5e18; //5 ETH

    //1 ETH = 1e18

    //array to collate funders
    address[] public funders;

    //mapping to keep address to amount funded
    mapping(address funder => uint amountFunded) public addressToAmountFunded;

    //funtion to fund the account
    function fund() public payable {

        require(msg.value.getConversionRate() >= minimumUSD, "Insufficient funds. The minimum funding amount is 5 ETH.");
        //1 ** 10 ** 18, 1000000000000000000

        funders.push(msg.sender);

        //amounts adds to the caller of the function balance
        addressToAmountFunded[msg.sender] += msg.value;

    }

    function withdraw() public{

        //starting index, ending index, 
        for(uint funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        //resetting the array
        funders = new address[](0);

        //to withdraw the funds, transfer, send, call

        // //transfer
        // payable (msg.sender).transfer(address(this).balance);

        // //send
        // bool sendSuccess = payable (msg.sender).send(address(this).balance);
        // require(sendSuccess, "Call failed");

        //call
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");

        //Call is the recommended way of sending ether

        
    }


}
