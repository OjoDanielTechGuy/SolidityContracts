/*This is to be on remix for web using the environment (Injector Provider) 
to get the right information*/

(async () => {
    let accounts = await web3.eth.getAccounts(); //this gets the accounts details
    console.log(accounts, accounts.length);//.length gets the number of accounts

    let balance = await web3.eth.getBalance(accounts[0]); //this gets the accounts balance
    console.log(balance);

    //this converts balance to ether
    let balanceInEth = web3.utils.fromWei(balance.toString(), "ether");
    console.log(balanceInEth);
})()