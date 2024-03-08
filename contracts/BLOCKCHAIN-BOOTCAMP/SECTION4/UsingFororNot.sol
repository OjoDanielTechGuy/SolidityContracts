// SPDX-License-Identifier: MIT

//Using For vs Not using For
pragma solidity ^0.8.14;

library Search {
    function indexOf(uint[] storage self, uint value)
    public
    view
    returns(uint)
    {
        for(uint i = 0; i < self.length; i++)
            if (self[i] == value) return i;
        return uint(1);
    }
}

/*Here we have one uint[] array, but to search and use the “indexOf” function 
we need to explicitly call the Library function.*/

contract NotUsingFor {
    uint[] data;
    
    function append(uint _value) public {
        data.push(_value);
    }

    function replace(uint _old, uint _new) public {
        //This performs the library function call
        uint index = Search.indexOf(data, _old);
        if(index == uint(1))
            data.push(_new);
        else
            data[index] = _new;
    }
}

contract UsingFor {

    using Search for uint;
    uint[] data;

    function append (uint _value) public {
        data.push(_value);
    }

    function replace (uint _old, uint _new) public {
        //This performs the function call
        uint index = data.indexOf(_old);

        if(index == uint(-1))
            data.push(_new);

        else 
            data[index] = _new; 
    }
}