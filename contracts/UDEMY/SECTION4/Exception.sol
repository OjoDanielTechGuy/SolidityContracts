// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

/*REQUIRE & ASSERT
--
REQUIRE: It can mainly be used for input/output validation
- Require returns gas while Assert does not return gas

ASSERT: This is use to check for invariants, the state where our contracts or variables should not reach
- It can check status of the smart contracts that should neve be violated
*/
contract ExceptionHandling {

    mapping(address => uint64) public balancedReceived;

    function recieveMoney() public payable {
        assert(msg.value == uint64(msg.value));
        balancedReceived[msg.sender] += uint64(msg.value);
        assert(balancedReceived[msg.sender] >= uint64(msg.value));
    }

    function withdrawFunds(address payable _to, uint64 _amount) public {
        require(_amount <= balancedReceived[msg.sender], "You do not have sufficient funds to");
        assert(balancedReceived[msg.sender] >= balancedReceived[msg.sender] - _amount);
        balancedReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
}

contract WillThrow {

    //this function throws fixed error
    function aFunction() public {
        require(false, "Error Message");
    }
}

//contract to catch error within a function call also emitting an event with error message
contract ErrorHandling {

    //creating event to log error message
    event ErrorLogging(string reason);

    function catchError() public {
        WillThrow will = new WillThrow();
        
        try will.aFunction() {

        } catch Error (string memory reason) {
            emit ErrorLogging(reason);
        }

    }
}