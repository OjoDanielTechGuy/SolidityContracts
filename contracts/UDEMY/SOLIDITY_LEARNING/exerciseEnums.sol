// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 <= 0.9.0;

contract enumExercise  {

/*Exercise
     1. create an enum for the color of shirts called shirtColor and set it to the options of either RED or WHITE or BLUE
     2. create a data of shirtColor called defaultChoice which is constant set to color BLUE
     3. create a data of shirtColor called choice and don't initiate the values
     4. create a function called setWhite which changes the shirt color of shirtColor to WHITE
     5. create a function getChoice which returns the current choice of shirtColor
     6. create a function getDefaultChoice which returns the default choice of shirtColor
     */ 

     //1.
     enum shirtColor {RED, WHITE, BLUE}

     //2.
     shirtColor constant defaultChoice = shirtColor.BLUE;

     //3.
     shirtColor choice;

     //4.
     function setWhite() public {
        choice = shirtColor.WHITE;
     }

     //5.
     function getChoice() public view returns(shirtColor) {
        return choice;
     }

     //6.
     function getDefaultChoice() public pure returns(uint) {
        return uint(defaultChoice);
     }

}
