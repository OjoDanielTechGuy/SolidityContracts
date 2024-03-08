/**The ABI Array contains all functions, inputs and outputs, as well as variables and thier
 * types from a smart contract
 * 
 * - If you want to interact with a smart contract from web3.js, Two things are needed:
 * 1.   The ABI array
 * 2.   The contract address (or the deployed contract through web3js)
 */
//using ABI Array to interact with the smart contract via scripting from Debugging.sol
(async() => {

    //get contract address from Debuggin.sol
    const address = "0xd9145CCE52D386f254917e481eB44e9943F39138";

    //get the abiArray from Debugging.sol
    const abiArray = [
	{
		"inputs": [],
		"name": "myUint",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "newUint",
				"type": "uint256"
			}
		],
		"name": "setMyUint",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	}
]; 

    //getting the contract Instance
    const contractInstance = new web3.eth.Contract(abiArray, address);
    console.log(await contractInstance.methods.myUint().call()); //methods given in the abiArray

    let accounts = await web3.eth.getAccounts(); //get accounts
    console.log("Account 1: ", accounts[0]);
    
    //overridding the contract Instance
    let txtResult = await contractInstance.methods.setMyUint(300).send({from: accounts[0]});
    console.log(await contractInstance.methods.myUint().call());
    console.log(txtResult);

})()