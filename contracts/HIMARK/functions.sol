//TREATING FUNCTIONS - VIEW, PURE, FUNCTION MODIFIER

//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.7;

contract ViewandPure {

    uint public x = 1;

    //view and pure are a Getter functions

    //view function is not modifying the state
    function addToX(uint y) public view returns(uint) {
        return x + y;
    }

    //pure function is not modifying or reading from the state
    function add(uint i, uint j) public pure returns(uint){
        return i + j;
    }
}

contract FunctionModifier {
    //variables to demonstrate modifier
    address public owner;
    uint public x = 10;
    bool public locked;

    constructor() {
        //setting transaction sender as the owner of the contract
        owner = msg.sender;
    }

    //modifier function to check that the caller is the owner of the contract
    modifier onlyOwner{ //modifier usually check other functions prior to execution

        require(msg.sender == owner, "Not Owner");
        //require throws an error  and stop executing if some condition is not true

        // Underscore is a special character only used inside
        // a function modifier and it tells Solidity to
        // execute the rest of the code.
        _;        
    }

    // Modifiers can take inputs. This modifier checks that the
    // address passed in is not the zero address.
    modifier validAddress(address _addr) {
        require(_addr != address(0), "Not valid address");
        _;
    }

    function changeOwner(address _newOwner) public onlyOwner validAddress(_newOwner) {
        owner = _newOwner;
    }

    // Modifiers can be called before and / or after a function.
    // This modifier prevents a function from being called while
    // it is still executing.
    modifier noReentrancy() {
        require(!locked, "No receentrancy");

        locked = true;
        _;
        locked = false;
    }

    function decrement(uint i) pubAlic noReentrancy {
        x -= i;

        if (i > 1) {
            decrement(i - 1);
        }
    }
}