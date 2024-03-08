// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

//OPERATORS - operators in a programming language is a symbol that tells the compiler
//or interpreter to perform certain mathematical, relational or logical operation
//and produce final result.

//Arithmetic operators: Operators +, -, %

//Operands: variables

//Operators: signs

contract Operators {
//calculator function
    function calculator() public pure returns(uint) {
        uint a = 20;
        uint b = 15;
        // uint result = a / b; //arithmetic operation
        uint result = a % b; //modular operation
        return result;
    }
/*modular remainder trick
---
1. divide the dividend (first number) by the divisor (second number)
2. disregard the fraction in the result
3. multiply the result (quotient) by the divisor (second number)
4. subtract the new result from the dividend (first number)
----
A. 12 % 23 - find the remainder using the above
1. dividend = 12, divisor = 23
2. quotient = 12 / 23, q = 0
3. q = 0 * 23 divisor:  nR= 0
4. 12 dividend - 0 nR; R = 12
*/

//Arithmetic Operators: +,-, --, ++, *, /, %
//Exercise
//--
//a = 2, b = 12

//1. a + b - b + a = 2 + 12 - 12 + 2 = 4
//2. a * b * b - 1 = 2 * 12 * 12 - 1 = 287
//3. b + b++ + a++ = 12 + (12+1) + (2+1) = 12 + 13 + 3 = 28
//4. (b % a) + 3 = (12 % 2) + 3 =0

}

contract ComparisonOperators {
    
//comprison operators - Operators whihch compares operands
// Less than, Greater than: <. >, equality ==, inequality !=
// greater than or equal >=, less than or equal <=

    uint a = 323;
    uint b = 54;

    function compare() view public {
        //less than using require stmt
        //if a is not less b, show that is false
        // require(a > b, "That is false");

        //equality  
        // require( a == b, "That is false");

        //inequality
        // require( a != b, "That is false");

        //Exercise - Only run the function compare so that a is equal to or less than b
        //otherwise submit the message - This comparison is false
        require( a <= b, "This comparison is false");
    }
}


contract LogicalOperators {

    //Logical operator - && (Logical AND), || (Logical OR, ! (Logical NOT)
    //BItwise operator - &, |, ^ (XOR)

    

    function logic() public pure returns (uint) {
        uint a = 4;
        uint b = 5;

        uint result = 0;
        if(a < b || a == 5) {
            result = a + b;
        }
        return result;
    }

//Exercise
// 1. Create a function which will multiply a by b then divide the result by b
// 2. Only return the multiplication of the function if b is greater than a AND a does not equal b
// 3. Initialize a = 17 and b = 32

    uint a = 17;
    uint b = 32;

    function logicMultiply() public view returns(uint) {
        uint result;
        if(b > a && a != b) {
            result = (a * b) / b;
        }
        return result;
    }
}

contract AssignmentOperator {
    //assignment operator  a = b (a is assigned the value of b)

    uint b = 4;
    uint a = 3;

    function assing() public view returns(uint) {
        uint c = 2;
        // return c + c + b; //rewrite this in assign form
        // return c = c + c + b; //rewrite in shorthand
        return c += c + b;  //+= shorthand
    }

//Exercise
// 1. Create a contract called final exercise (finalExercise)
// 2. Initialize 3 state variables a, b, f
// 3. Assign each variable the following: a = 300, b = 12, f = 47
// 4. Create a function called finalize that is public and viewable which returns
// a local variable d
// 5. Initialize d to 23
// 6. Return d in short hand assignment form to multiply itself by itself and then
// subtracted by b
// 7. Bonus: make the function conditional so that it will only return multiplication
// if a is greater than or equal to a and b is less than f otherwise d should return 23
}

contract finalExercise {
 
    //initializing state variable
    uint a = 300;
    uint b = 12;
    uint f = 47;

    function finalize() public view returns(uint) {
        
        uint d = 23;

        if(a >= a && b <= f) {
            d = d*d;
            return d - b;
        } else {
            return d;
        }
    }


}