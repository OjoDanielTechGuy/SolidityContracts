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
- To Deploy
  > Run ***forge create (name of smart contract)*** OR
  > Run ***forge create (name of contract) ---rpc-url (url gotten from running local blockchain) --private-key (copy and paste the private key)***

---

#### Private Key Safety: 

- To remove your private key from your history in Bash, execute the following command:
  > **history c**
*
- This effectively clears your command history. Try hitting the 'up' arrow on your keyboard - you will not return any previously entered commands. To further test this, you can use the history keyword:
  > **history** then click on **clear**

#### ***Note: In VSCode Extensions install Nomic (Solidity), Even Better TOML***
