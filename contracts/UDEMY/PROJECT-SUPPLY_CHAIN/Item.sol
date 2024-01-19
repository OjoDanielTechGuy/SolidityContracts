//SPDX-License-Identifier: MIT

import "contracts/UDEMY/PROJECT-SUPPLY_CHAIN/ItemManager.sol";

pragma solidity ^0.8.19;

contract Item {

    uint public priceInWei;
    uint public paidWei;
    uint public index;

    ItemManager parentContract; //instance of the contract ItemManager

    constructor(ItemManager _parentContract, uint _priceInWei, uint _index) public {
        priceInWei = _priceInWei;
        index = _index;
        parentContract = _parentContract;
    }

    //fallback function - to receive ethers
    receive() external payable { 
        require(msg.value == priceInWei, "We don't support partial payments");
        require(paidWei == 0, "Item is already paid!");
        paidWei += msg.value;
 
        /**method: to encode function name and parameters in a specific format called ABI encoding
        The function trigger payment is used to send a payment to a specified address and
        the uint256 indicates that the function can accept a number of upto 256bits as input
        This is use to ensure that transaction are executed correctly**/

        (bool success, ) = address(parentContract).call{value:msg.value}(abi.encodeWithSignature("triggerPayment(uint256)", index));

        require(success, "Delivery did not work");
    }

    fallback() external {}
}
