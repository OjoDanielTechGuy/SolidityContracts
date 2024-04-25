// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 <= 0.9.0;

/*
    assert(bool condition) - If condition is not met, this method call causes an invalid opcode
    and any changes done to the state get reverted. This method is to be used for internal errors.

    require(bool condition) - If condition is not met, this method call reverts to the original state.
    - This method is to be used for errors in inputs or external components.
    
    require(bool condition, string memory message) - If conditon is not met, this method call reverts to 
    original state
    - This method is to be used for errors in inputs or external components. It provides an option to provide
    a custom message

    revert() - This methods aborts the execution and revert any changes done to the state

    revert(string memory reason) - This method aborts the execution and revert any changes done to the state
    - It provides an option to provide a custom message
*/

contract LearnErrorHandling {

    bool public sunny = true;
    bool public umbrella = false;
    uint finalCalc = 0;

    //solar panel machine
    function solarCalc() public {
        //using require
        require(sunny, "It is not sunny today!!!");
        finalCalc += 3;
        //making sure finalCalc !=6
        assert(finalCalc !=6);
        
    }

    //machine that controls the weather
    function weatherChange() public {
        sunny = !sunny;
    }

    //grab final finalCalc
    function getCalc() public view returns(uint) {
        return finalCalc;
    }

    //get umbrella
    function bringUmbrella() public {
        if(!sunny) {
            umbrella = true;
        }
        else {
            revert("No need to bring an umbrella today");
        }
    }
}

/*
Exercise - 
1.  Create a contract called Vendor with the state variable address seller
    It should contain a modify onlySeller that requires msg.sender to be the seller
2.  Add a function becomeSeller which sets the seller to the msg.sender
3.  Create a function named sell which is payable and checks to see if an input of an element
is greater than the msg.value and in the event to revert that there is not enough ether provided
as a throw error
*/

//1
contract Vendor {
    
    address public seller;

    modifier onlySeller() {
        require(msg.sender == seller, "Only the Seller can sell this");
        _;
    }

    //2.
    function becomeSeller() public{
        seller = msg.sender;
    }

    //3
    function sell(uint _amount) payable public onlySeller {
        if(_amount > msg.value) revert("There is not enough ether provided"); 
        
    }
}
