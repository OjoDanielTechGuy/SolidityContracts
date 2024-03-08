// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract usingEnums {

    //Enums restrict variables to only have a predefined values
    //with Enums you can reduce the number of bugs in your code

    //enums for pizza app that offers large, medium or small

    enum pizzaSize {LARGE, MEDIUM ,SMALL}
    
    //instance of pizzaSize
    pizzaSize choiceOfSize;

    //a default choice for pizza
    pizzaSize constant defaultChoice = pizzaSize.MEDIUM;

    //set small pizza
    function setSmall() public {
        choiceOfSize = pizzaSize.SMALL;
    }

   function getChoice() public view returns(pizzaSize) {
    return choiceOfSize;
   }

    function getDefaultChoice() public pure returns(uint) {
        return uint(defaultChoice);
    }

}
