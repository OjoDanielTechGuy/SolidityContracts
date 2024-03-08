//NOTE - Having Unit Tests is absolutely important
// --FIRST TEST CODE --(UNCOMMENT CODES TO PERFORM UNIT TEST)//

/** const Spacebear = artifacts.require("Spacebear");

contract("Spacebear", (accounts) => {
    it('should credit an NFT to a specific account', async () => {
        const spacebearInstance = await Spacebear.deployed();
        await spacebearInstance.safeMint(accounts[1],"spacebear_1.json");

            //updating with assert (this is a comment) - testing to pass || this will compare the first value to the second value
        assert.equal(await spacebearInstance.ownerOf(0), accounts[1], "Owner of token is the wrong address");
            
            //testing to fail (this is a comment)
        assert.equal(await spacebearInstance.ownerOf(0), accounts[1], "Owner of token is the wrong address");
        })
    }) **/
//-----------------------//

// --SECOND TEST CODE USING "Chai assertions" (UNCOMMENT CODES TO PERFORM UNIT TEST)--//

/** const Spacebear = artifacts.require("Spacebear");

    contract("Spacebear", (accounts) => {
        it('should credit an NFT to a specific account', async () => {
            const spacebearInstance = await Spacebear.deployed();
            let txResult = await spacebearInstance.safeMint(accounts[1],"spacebear_1.json");

            assert.equal(txResult.logs[0].event, "Transfer", "Transfer event was not emitted")
            assert.equal(txResult.logs[0].args.from, '0x0000000000000000000000000000000000000000', "Token was not transferred from the zero address");
            assert.equal(txResult.logs[0].args.to, accounts[1], "Receiver wrong address");
            assert.equal(txResult.logs[0].args.tokenId.toString(), "0", "Wrong Token ID minted");

            assert.equal(await spacebearInstance.ownerOf(0), accounts[1], "Owner of Token is the wrong address");
        })
    })  **/
//-----------------------//

// --THIRD TEST CODE (using truffle assertions)--//

const Spacebear = artifacts.require("Spacebear");
const truffleAssert = require('truffle-assertions');


contract("Spacebear", (accounts) => {
    it('should credit an NFT to a specific account', async () => {
        const spacebearInstance = await Spacebear.deployed();
        let txResult = await spacebearInstance.safeMint(accounts[1],"spacebear_1.json");

        truffleAssert.eventEmitted(txResult, 'Transfer', 
        {from: '0x0000000000000000000000000000000000000000', to: accounts[1], tokenId: web3.utils.toBN("0")});

        assert.equal(await spacebearInstance.ownerOf(0), accounts[1], "Owner of Token is the wrong address");
    })
})

/**
 * What is web3.utils.toBN("0"): Since Solidity ranges from 2^256 which is way larger and In other to work
 * - with such large numbers as the tokenId contains large numbers, using the toBN, they are automatically 
 * converted to be used with a library called "Bignumber.js".
 * 
 * Bignumber.js (toBN) allows for arbitrary large arithmetic operations. 
This why all (unsigned) integers are automatically converted and Bignumber is used everywhere.**/

//-----------------------//