// SPDX-License-Identifier: MIT

//Get funds from user
//Withdraw funds
//Set a minimum funding value in USD

//importing PriceConverter
import "./PriceConverter.sol";

pragma solidity ^0.8.21;

//creating custom error to save gas
error NotOwner();

contract FundMe {

    using PriceConverter for uint;

    uint public MINIMUM_USD = 5e18; //5 ETH
    //GAS fees, using constant = 303 
    //GAS fees, without constant = 2402

    //1 ETH = 1e18

    //global variable
    address public i_owner;
    //GAS fees using immutable = 439
    //GAS fees using non-immutable = 2,574

    //constructor to initialize upon contract deployment
    constructor() {
        i_owner = msg.sender;
    }

    //array to collate funders
    address[] public funders;

    //mapping to keep address to amount funded
    mapping(address funder => uint amountFunded) public addressToAmountFunded;

    //funtion to fund the account
    function fund() public payable {

        require(msg.value.getConversionRate() >= MINIMUM_USD, "Insufficient funds. The minimum funding amount is 5 ETH.");
        //1 ** 10 ** 18, 1000000000000000000

        funders.push(msg.sender);

        //amounts adds to the caller of the function balance
        addressToAmountFunded[msg.sender] += msg.value;

    }

    function withdraw() public onlyOwner {

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
        revert();

        //Call is the recommended way of sending ether
    }

    //modifier to allow easy replication of securing function
    modifier onlyOwner() {
        // require(msg.sender == i_owner, NotOwner);
        //apply condition to activate the custom error
        if(msg.sender != i_owner) {
            revert NotOwner();
        }
        _;
    }

    fallback() external payable {
        fund();
    }

    receive() external payable {
        fund();
    }

}
