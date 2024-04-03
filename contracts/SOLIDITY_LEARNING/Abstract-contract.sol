// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 <= 0.9.0;

/*
Abstract contract is one which contrains at least one function without implementation
Such contract is usd as a base contract
--
Generall an abstract contains both implemented and abstract functions.
Derived contract will implement the abstract function and use the existing functions as and when required

*/

//base
contract X {

    //since the function has no implementation we should mark it as virtual
    function y() public virtual  view returns(string memory) {}
}

//derive
contract Z is X {
    //override uses the current named functioned used
    function y() public override pure returns(string memory) {
        return "Hello Daniel";
    }
}

//technically contract is still abstract if it has one function without a body
//base contract

abstract contract Member {

    string name;
    uint age = 28;

    //because function setName has no body the contract is now abstract
    function setName() public virtual view returns(string memory);

    function returnAge() public view returns(uint) {
        return age;
    }
}

//derived contract
contract Teacher is Member {

    function setName() public pure  override returns(string memory) {
        return "Daniel Ojo";
    }
}

/*
Exercise:
1. Create an abstract base contract called Calculator with a read only public function that returns integers
2. Create a derived contract called Test which derives the Calculator contract and can 
calculate 1 + 2 and return the result
*/

//base contract
//1.
abstract contract Calculator {

    function readOnly() public virtual view returns(uint);
}

//derived contract
//2.
contract Test is Calculator {

    function readOnly() public override pure returns(uint) {
        uint a = 1;
        uint b = 2;
        uint result = a + b;
        return result;
    }
}
