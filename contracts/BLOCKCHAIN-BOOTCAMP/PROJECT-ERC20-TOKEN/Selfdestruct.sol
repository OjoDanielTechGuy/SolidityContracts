//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

//Destroying Smart Contract using selfdestruct

/** The data on the blockchain is forever, but the state is not.
* That means, we can not erase information from the Blockchain but we can update 
- the current state so that you can't interact with an address anymore going forward
- Everyone can always go back in time and check what was the value on day X but
- once the function selfdestruct() is called, you can't interact with a Smart Contract anymore.
*/

contract SelfDestruct {

    receive() external payable{} //For empty call data (and any value)

/** The (selfdestruct function) takes one argument, an address.
* When selfdestruct is called, all remaining funds on the address of the Smart Contract are 
- transferred to that address.
* It's important to note, that the EVM will transfer funds to that address no matter what.
* So, even if another smart contract is the target address and that smart contract doesn't 
- define a payable receive function, he will still receive the funds.
* 
*********************
********************
* The selfdestruct takes one argument, an address, which receives all funds stored 
on the contract address.  
* Then it will remove the contract code from state. 
* The address of the contract is then empty going forward.
* Once you call destroySmartContract, the address of the Smart Contract will contain no more code
*  You can still send transactions to the address and transfer Ether there, but there won't be any 
- code that could send you the Ether back.
*/

    function destroySmartContract() public {
        
        selfdestruct(payable(msg.sender)); //Note: selfdestruct is already deprecated
    }
}