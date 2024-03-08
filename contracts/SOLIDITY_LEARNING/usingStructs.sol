// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

//structs are used to represent a record, to keep track of your information

contract usingStruct {
    
    struct Movie {
        string title;
        string director;
        uint movie_id;
    }

    //to use the struct, create an instance of the struct
    Movie movie;
    
    //3.
    Movie comedy;
    
    function setMovie() public {
        // movie = Movie("Avatar The Last Airbender", "Dave Filoni", 1);
        
        //1.
        // movie = Movie("Code 8 Part II", "Jeff Chan", 2);
        comedy = Movie("Sabinus Comedy", "Bakare", 3); //4.
    }

    function getAllMovies() public view returns(Movie memory) {
        // return movie;
        return comedy;
    }

    function getMovieId() public view returns(uint) {
        //2.
        // return movie.movie_id;

        //5.
        return comedy.movie_id;
    }

    //Exercise
    //1. create a new movie and set it up so that it updates to the movie in setMovie function
    //2. return the id of the new movie
    //3. create a new var called comedy and set up comedy to the datatype Movie
    //4. upate the setMovie function with a comedy movie that contain name, director and id
    //5. return the movie of the comedy
}

