// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 < 0.9.0;

/*if_else statement: The if statement is a form of control statement that allows 
Solidity to execute statements in a more controlled way
*/

contract DecisionMaking {
    //Sample
    uint oranges = 4; // one equal sign = assigning a variable, two equal == sign rep. equivalent

    function validateOranges() public view returns(bool) {
        if(oranges == 5) {
            return true;
        } else {
            return true;
        }
    }

    //Exercise
/*
- 1. Create a stakingWallet variable as an integer and set to 10
- 2. Create a function airDrop and set to public visiblity, IDE to view and return an integer
- 3. Create a decision making logic so that if wallet has a value 10 then add 10 more
- 4. add an else statement so that if wallet is not 10 add value of 1
- 5. return the value of the wallet
- 6. Deploy the contract and show the results
*/
    uint stakingWallet = 10; //creating variable

    //creating function airDrop, visibility of public and view IDE and return stmt
    function airDrop() public view returns(uint) {
        if(stakingWallet == 6){
            return stakingWallet + 10;
        } 
        else {
           return stakingWallet + 1;
        }
    }




}