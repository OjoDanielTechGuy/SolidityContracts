//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract ThrowError {
    error NotAllowedError(string);
    
    function sampleFunction() public pure{
        // require(false, "Throwing require error");
        // assert(false);
        revert NotAllowedError("This is not allowed");
    }
}

contract ErrorHandling {
    event RequireErrorLogging(string reason);
    event AssertErrorLogging(uint code);
    event CustomErrorLogging(bytes lowLevelData);

    function catchTheError() public {
        ThrowError throwError = new ThrowError();
        try throwError.sampleFunction() {
            //add code here
        } catch Error(string memory reason) { //require will fire an exception called Error
            emit RequireErrorLogging(reason);
        } 
        //assert will fire an exception called Panic
        catch Panic(uint code) {
            emit AssertErrorLogging(code);
        }
        //custom error tallies with bytes memory
        catch(bytes memory lowLevelData) {
            emit CustomErrorLogging(lowLevelData);
        }
    }
}
