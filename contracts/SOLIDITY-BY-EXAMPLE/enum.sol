//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.13;

contract Enum {
/*enum stand for Enumerable - they are user defined data types that restrict the variable to have only
one of the predefined values. Note: Internally enums are treated as numbers*/

    //enum representing shipping status

    enum Status {
        //it returns uint
        Pending, //0
        Shipped, //1
        Accepted, //2
        Rejected, //3
        Cancelled //4
    }

    Status public status;

    function get() public view returns(Status) {
        return status;
    }

    //updating status by passing in uint
    function set(Status _status) public {
        status = _status;
    }

    //updating to a specific enum
    function cancel() public {
        status = Status.Rejected;
    }

    //delete keyword reset the enum
    function reset() public {
        delete status;
    }
}
