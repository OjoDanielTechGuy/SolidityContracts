/*Web3.js is a javascript library that lets you interact with a blockchain node via its RPC interface.
That can be a RESTful HTTP interface, or WebSockets.

- This is to be on remix for web using the environment (Injector Provider) to get the 
right information.

web3.eth === runs an anonymous main function, which is using the async/await syntac to 
work with promises**/

(async () => {
    let accounts = await web3.eth.getAccounts(); //this gets the accounts details
    console.log(accounts, accounts.length);//.length gets the number of accounts
    console.log("Accounts 1: ", accounts[0]); //This gets the first account

    let balance = await web3.eth.getBalance(accounts[0]); //this gets the accounts balance
    console.log(balance);

    //this converts balance to ether
    let balanceInEth = web3.utils.fromWei(balance.toString(), "ether");
    console.log(balanceInEth);
})()