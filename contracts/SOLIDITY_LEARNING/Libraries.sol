 // SPDX-License-Identifier: MIT
 pragma solidity >= 0.7.0 <= 0.9.0;

 /*
 LIBRARIES: Libraries are similar to contracts, 
 but their purpose is that they are deployed only once at a specific address and their code is reused.
 -
 Library functions can be called directly if they do not modify the state
 That means pure and view functions only can called from outside the library
 -
 Library cannot be destroyed as it assumed to be stateless

 A Library cannot have state variable
 A Library cannot inherit any element
 A Library cannot be inherited
 */

 library Search {
    //a function loop to return the index value of some integer we are searching for
    function indexOf(uint[] storage _self, uint _value) public view returns(uint) {
        //using for loop
        for(uint i=0; i < _self.length; i++) if(_self[i] == _value) return i;
    }
 }

 contract Test {
    uint[] data;

    constructor() {
        data.push(1);
        data.push(2);
        data.push(3);
        data.push(4);
        data.push(5);
    }

    function isValuePresent(uint _val) external view returns(uint) {
        uint value = _val;
        uint index = Search.indexOf(data, value);
        return index;
    }
}

/*
Exercise:
-
The directive using A for B; can be used to attach library function of library A to a given type B.
These functions will use the caller type as their first parameter (identified using self)

1. Copy over the library Search and contract Test and rename library Search to Search2
and contract Test to Test2

2. Using the A for B library pattern assign the new library to an empty array type and rewrite the code
so that same search hardcoded can be run with the value of 4 accordingly 
*/

library Search2 {
        function indexOf(uint[] storage _self, uint _value) external view returns(uint) {
            for(uint i = 0; i < _self.length; i++) if(_self[i] == _value) return i;
        }
}

contract Test2 {
    //using A (library) for B (another element)

    using Search2 for uint[];

    uint[] data;

    constructor() {
        data.push(1);
        data.push(2);
        data.push(3);
        data.push(4);
        data.push(5);
    }

    function isValuePresent() external view returns(uint) {
        uint value = 4;
        uint index = data.indexOf(value);
        return index;
    }
}
