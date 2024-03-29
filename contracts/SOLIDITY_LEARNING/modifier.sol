//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

// Function Modifiers are used to modify the behaviour of a function. 
// Function Modifiers are customizable modification for functions

contract Owner {
    // function modifiers
    
    address owner;
    
    // when we deploy this contract we want to set the address to the owner (msg.sender)
    
    constructor() public {
        owner = msg.sender; 
    }
    
    // to write a modifier we statically declare the modifier keyword and then name it 
    // and inside we write our logic and modifications  
    modifier onlyOwner {
        // customizable logic to modify our functions 
        require(msg.sender == owner);
        _;
        // the underscore continues with the function 
    }
    
    modifier costs(uint _price) {
        // what msg.value: the amount in wei being sent with a 
        // message to a contract 
        require(msg.value >= _price);
        _;
    }
    
}


// is is a keyword grabbing inheritance from another contract - Owner

contract Register is Owner {
    
    // what in this code is currently modifying the functions? 
    
   mapping (address => bool) registeredAddresses;
   uint price;
   
   constructor(uint _initialPrice) public { 
       price = _initialPrice; 
       
   }
   
   // function register will set msg.sender (current caller) to true
   function register() public payable costs(price) {
       // the logic will modify the outcome 
      registeredAddresses[msg.sender] = true;
   }
   
   // onlyOwner is our function modifier that requires
   // only the owner to be able to change the price
   function changePrice(uint _price) public onlyOwner {
      price = _price;
   }
   
}
