// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;
/*
Mapping is a reference types as arrays and struct,
Mapping allows you to save data as key and value

-- get, set delete from mappings
*/

contract usingMappings {

    mapping(address => uint) public myMap;

    //set
    function setAddress(address _addr, uint _i) public {
        myMap[_addr] = _i;
    }
    
    //get
    function getAddress(address _addr) public view returns(uint) {
        return myMap[_addr];
    }

    //delete
    function removeAddress(address _addr) public {
        delete myMap[_addr];
    }

/*
Mapping Assignment:
1. Create a unique datatype as a struct called Movie and give it the string properties: title and director
2. Create a map called movie which takes a uint as a key and Movie as a value
3. Create a function called addMovie which takes three inputs, movie id, title and director which
assigns a value of an integer to a movie added back to the movie map. It should have a title and director name.
4. Deploy the contract and update the movie information to the movie map with our favourite movie!
*/


//1.
    struct Movie {
        string title;
        string director;
    }

//2.
    mapping(uint => Movie) public movie;
    
    mapping(address => mapping(uint => Movie)) public myMovie; //nested mapping

//3.
    function addMovie(uint _movie_id, string memory _title, string memory _director) public{
        movie[_movie_id] = Movie(_title, _director);
    }

    function addMyMovie(uint _id, string memory _title, string memory _director) public {
        //msg.sender servers a gloabl variable that stores the address that calls the contract
        myMovie[msg.sender][_id] = Movie(_title, _director);
    }

    function getMovie(uint _id) public view returns(Movie memory) {
        return myMovie[msg.sender][_id];
    }
}
