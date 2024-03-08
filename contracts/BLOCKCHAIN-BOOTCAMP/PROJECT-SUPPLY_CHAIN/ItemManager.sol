//SPDX-License-Identifier: MIT

/**Manager Smart Contract where items can be added, 
move them forward in the supply chain and trigger a delivery **/

import "contracts/UDEMY/PROJECT-SUPPLY_CHAIN/Item.sol";
import "contracts/UDEMY/PROJECT-SUPPLY_CHAIN/Ownable.sol";

pragma solidity ^0.8.19;

contract ItemManager is Ownable {

    struct S_Item {
        ItemManager.SupplyChainSteps _step;//instance of the enum
        string _identifier;
        Item _item;
    }

    mapping(uint => S_Item) public items;
    uint index;

    //enum to house three different states
    enum SupplyChainSteps{Created, Paid, Delivered}

    event SupplyChainStep(uint _itemIndex, uint _step, address _address);

    function createItem(string memory _identifier, uint _priceInWei) public onlyOwner{
        Item item = new Item(this, _priceInWei, index);
        items[index]._item = item;
        items[index]._step = SupplyChainSteps.Created;
        items[index]._identifier = _identifier;
        emit SupplyChainStep(index, uint(items[index]._step), address(item));
        index++;
    }

    //function to trigger when payment is made
    function triggerPayment(uint _index) public payable {
        Item item = items[_index]._item;
        require(address(item) == msg.sender, "Only items are allowed to update themselves");
        require(item.priceInWei() == msg.value, "Not fully paid yet");
        
        require(items[index]._step == SupplyChainSteps.Created, 
            "Item is further in the supply chain");

        items[_index]._step = SupplyChainSteps.Paid;
        emit SupplyChainStep(_index, uint(items[_index]._step), address(item));
    }

    function triggerDelivery(uint _index) public onlyOwner {
         require(items[_index]._step == SupplyChainSteps.Paid, 
            "Items is further in the supply chain");

        items[_index]._step = SupplyChainSteps.Delivered;
        emit SupplyChainStep(_index, uint(items[_index]._step), address(items[_index]._item));
    }
}  