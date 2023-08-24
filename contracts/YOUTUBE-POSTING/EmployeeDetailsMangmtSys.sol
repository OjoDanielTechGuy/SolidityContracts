//Smart contract to store and return employee details

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EmployeeMangmtSys {

    struct Employee {
        int empId;
        string name;
        string department;
        string designation;
    }

    Employee []emps;//dynamic array

    //function to add employee details
    function addEmployee(
        int _empId, string memory _name, string memory _department, string memory _designation) public {

            Employee memory e = Employee(_empId, _name, _department, _designation);
            emps.push(e);
        }

    //function to get employee details
    function getEmployee(int _empId) public view returns
        (string memory, string memory, string memory) {

            uint i;
            for(i = 0; i < emps.length; i++) {

                Employee memory e = emps[i];

                //looks for matching records
                if(e.empId == _empId){
                    return (e.name, e.department, e.designation);
                }
            }
            //if id is not present return not found
            return("Employee Details not Found","Not Found", "Not Found");
        }
    
}