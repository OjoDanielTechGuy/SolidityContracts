//SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.14;
/**
- Address.call comes in when you don't know: 
1.  The receiving contract is a contract
2.  And that the receiving contract has a specific function
*/

contract FirstContract {

    mapping(address => uint) public addressBalance;

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        
        addressBalance[msg.sender] += msg.value;
    }

    receive() external payable {
        addressBalance[msg.sender] += msg.value;
    }
}

contract SecondContract {

    function deposit() public payable {}

    //HIGH LEVEL CALLS
    // function depositOnFirstContract(address _firstContract) public {
    //     FirstContract contractOne = FirstContract(_firstContract);
    //     contractOne.deposit{value: 10, gas: 100000}();
    // }

    //LOW-LEVEL CALLS ON ADDRESS-TYPE VARIABLES
        // function depositOnFirstContract(address _firstContract) public {
        //     bytes memory payload = abi.encodeWithSignature("deposit()");
        //     (bool success, ) = __firstContract.call{value: 10, gas: 100000}(payload);
        //     require(success);
        
        //     /**it does exactly the same as above, but with low level calls(.call) and therefore
        //     the typesafety is gone*/
        // }

        // function depositOnFirstContract(address _firstContract) public {
        //     (bool success, ) = __firstContract.call{value: 10, gas: 100000}(_firstContract);
        //     require(success);
        //     /**it does exactly the same as above, but with low level calls(.call) and therefore
        //     the typesafety is gone*/
        // }

    function depositOnFirstContract(address _firstContract) public {
        (bool success, ) = _firstContract.call{value: 10, gas: 100000}("");
        require(success);
    }
}