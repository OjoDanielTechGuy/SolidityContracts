// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MarksManagmtSys {
    
    //creating struct to house student details
    struct Student {
        int ID;
        string fName;
        string lName;
        int marks;
    }

    address owner;
    //student count
    int public stdCount = 0;
    
    //mapping when int number is put in, show the student
    mapping(int => Student) public stdRecords;

    modifier onlyOwner {
        require(owner == msg.sender, "Not the owner of contract");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    //function to add new records
    function addNewRecords(
        int _ID,
        string memory _fName,
        string memory _lName,
        int _marks
        
    ) public onlyOwner {

        //increasing count by 1
        stdCount++;

        //fecth the student details using stdCount
        stdRecords[stdCount] = Student(_ID, _fName, _lName, _marks);
    }

    //function to add bonus
    function bonusMarks(int _bonus) public onlyOwner {
        stdRecords[stdCount].marks += _bonus;
    }

    // function bonusMarks(int _ID, int _bonus) public onlyOwner {
    //     stdRecords[_ID].marks += _bonus;
    // }
}

