// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 <= 0.9.0;

/*
Special Variables (global variables) - are globally available variables and provides information about the blockchain
Ex: msg.sender: Sender of message (current call),
msg.value (amount wei sent)
block.timestamp: current blocktimestamp 
block.number: current block number
*/

//https://docs.soliditylang.org/en/latest/units-and-global-variables.html (global variable documentation)

contract LedgerBalance {

    mapping(address => uint) public balance; // map of wallets with amounts

    //functon to update balance
    function updateBalance(uint _newBalance) public {
        balance[msg.sender] = _newBalance;
    }

}

//Assignment
/*
    1. create a new contract calld Update
    2. if you haven't done this, copy the contract Ledgerbalance above your new contract
    3. create a public function called updatesBalances
    4. instantiate the data type contract LedgerBalance to a new variable called ledgerBalance 
    (similar to struct or enum)
    5. set the new variable ledgerbalance = new LedgerBalance()
    6. update the ledgerbalance to 30
    7. display both contract update the ledgerBalance by 30 using the Updated contract
*/

contract Update is LedgerBalance {

    function updatesBalances() public {
        LedgerBalance ledgerBalance = new LedgerBalance();
        ledgerBalance.updateBalance(30);
    }
}

contract SimpleStorage {

    uint storedData;

    function set(uint _x) public {
        
        // storedData = _x;
        //global variable
        // storedData = block.difficulty;
        // storedData = block.timestamp;
        storedData = block.number;

    }

    function get() public view returns(uint) {
        return storedData;
    }
}

