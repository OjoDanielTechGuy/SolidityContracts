### Installing Foundry

---

### FOUNDRY DOCUMENTATIONS ON HOW TO INSTALL FOUNDRY - TERMINAL, WINDOWS

#### ***[Foundry Documentation](https://book.getfoundry.sh/)***

#### ***[Foundry Installation Website](https://getfoundry.sh/)***

---

- In your current file in the directory run ***forge init***
- ***forge build or forge compile*** to compile your document

---

#### Deploying to Blockchain 

- Check Forge Information
   > ***run forge --help***

- Run the blockchain locally by typing running ***anvil*** in the terminal directory
   > It displays the public keys, private keys and rpc url
- Open another terminal while local blockchain terminal is been run
- To Deploy the script
  > Run ***forge script script/(name of smart contract)*** OR
- To simulate on-chain transaction
  > Run ***forge script script/(name of contract) ---rpc-url (http://localhost from running local blockchain) --broadcast --private-key (copy and paste the private key)*** to simulate on-chain transaction

---

#### Private Key Safety: 

- To remove your private key from your history in Bash, execute the following command:
  > **history c**
*
- This effectively clears your command history. Try hitting the 'up' arrow on your keyboard - you will not return any previously entered commands. To further test this, you can use the history keyword:
  > **history** then click on **clear**

#### Private Key Safety2:
- Do not put your private key directly on the terminal but instead:
  > Create a **.env** file in your directory
  > Type in PRIVATE_KEY and RPC_URL then insert thier phrase respectively
- In running your code to simulate on-chain transaction: replace your localhost and private key numbers with $PRIVATE_KEY and $RPC_URL

#### ***Note: In VSCode Extensions install Nomic (Solidity), Even Better TOML***
