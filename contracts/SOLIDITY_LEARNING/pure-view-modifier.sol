// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 <= 0.9.0;

//view function does not modify the state but as a view for a return value
//pure function does not modify and read the state (return calculations)

contract MyContract {

    uint value;

    //this function modifies the state value
    function setValue(uint _value) external {
        value = _value;
    }

    //this function reads the state but does not modify it
    function getValue() external view returns(uint) {
        return value;
    }

    function getNewValue() external pure returns(uint) {
        //eth call
        //value = 2;
        return 3 + 3;
    }

/*
Exercise:
1. create a function called multiply which returns 3 multiply by 7
2. create another function called valuePlusThree which returns the state variable + 3
3. successfully deploy the contract and test for the results
**Remember** to use the appropriate modifying keywords appropriately
*/

//1. 
function multiply() external pure returns(uint) {
    return 3 * 7;
}

function valuePlusThree() external view returns(uint) {
    return value + 3;
}
}
