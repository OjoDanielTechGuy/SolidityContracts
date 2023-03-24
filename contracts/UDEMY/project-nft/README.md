
## TRUFFLE

---

#### The behemoth of all Toolkits for Ethereum Blockchain Development is Truffle. Its a heavyweight, the oldest and quite intense in terms of setup, usage, but also rich of features. <br> Truffle was the first Solidity Development Toolkit.

---

### Truffle Default Folder Structure

**In (almost) every truffle project, there's the same folder structure.**

1. There's a contracts folder, which contains the Smart Contracts.

2. There is a migrations folder, which contains scripts to deploy the contracts.

3. There is a tests folder, which contains the unit tests.

4. There is a config file named truffle-config.js which contains sensible defaults.

---

#### Installing and Using Truffle

- Open the terminal and install globally using **"npm install -g truffle"**.

- Create a folder a sub directory to be open in VS Code.

- Type in **truffle init** in the directory terminal to initialize the directory with the default folder structure.

- Initialize the folder with **npm init -y** to add package.json and other packages.

- Then create a .gitignore by typing in **echo "node_modules" > .gitignore** to ensure certain files are not tracked by Git.

- Install the openzeppelin via **npm install --save @openzeppelin/contracts**, What you get is the openzeppelin contracts in ***[NodeModules Directory](node_modules/@openzeppelin/contracts)***. This way we can import them now into our own contract.

---

#### Using your Contract Solidity File

-  Create a new file in contracts with your desired contract name, mine is **Spacebears.sol**
Using the contract sample codes from Remix of ***[Spacebears.sol](./contracts/Spacebears.sol)*** to illustrate the compilation process.

- After inputting the code, type in **truffle compile**

- After compilation, you should have a ***[build/contracts folder](./build/contracts/)***, containing contract artifacts.

---

#### Error likely to face during compilation

- **Compiler version problems**:  open truffle-config.js, on the bottom, there is the compiler version defined, change it to the specified version thrown by the error.

- **Specification of SPDX License Identifier**: Change it to the specified type in your the error solution displayed via the terminal.

- **Solidity version**: In this project the current version used is **0.8.19**

- **Import of openzeppelin contract error**: Your import statement on open zeppelin might throw an error of not found, use the full path directory to specify the location of the open zeppelin contract, when testing the
openzeppelin might throw an error, kindly revert back to the directory specification of open zeppelin contract

---

#### What happens after compilation

1. Truffle downloads a solidity compiler in the background (the version is defined in truffle-config).

2. Then it looks in the contracts folder for all solidity files and runs them through the solidity compiler.

3. From the compiled contracts it creates json-artifacts, which contain not only the **ABI(Application Binary Interface)**, but also the bytecode and the AST and much more.

4. When we deploy the code using truffle migrations, it will also contain the contract address on a specific network. Truffle will take care of this.

---

### DEPLOYEMENT WITH TRUFFLE TO GANACHE

- Create a js file with the preferred name in the migrations folder ending with **.js**, sample of code to be used in ***[01-spacebear-deployment.js](./migrations/01-spacebears-deployment.js)***

- Truffle development comes with a console simply type in **truffle develop**, You will get an interactive console where you can type in commands

- type in **migrate** And truffle will run the migrations and deploy the Spacebears contract on the chain:
- *.exit* to exit the terminal

##### Ganache is a private Ethereum blockchain environment that allows to you emulate the Ethereum blockchain so that you can interact with smart contracts in your own private blockchain

---

#### Installing and Starting Ganache

- Install the ganache globally using **npm install -g ganache**

- Simply type in **ganache** to run the ganache environment and it should come up with 10 accounts. Very much like the truffle development network

- Add the network of ganache to the **[truffle-config.js](./truffle-config.js)**, check sample in same file

- In another terminal type in **truffle migrate --network ganache** now your smart contract is on Ganache

---

#### Connecting to blockchain node

- To connect or write to a blockhain node, the truffle console environment has to be used, type in the terminal **truffle console --network ganache**

- In the console access the web3.js, query the accounts using **web3.eth.getAccounts()**

---

#### Minting an NFT using the Truffle Console

In web3js you access functions with contractInstance.methods.functionName() and in truffle-contract you access that with contractInstance.functionName().

- create a new contract Instance by typing in **const spacebear = await SpaceBear.deployed();**

- run **spacebear.name()**, It will make a call (which you can see in Ganache) and return the name stored in the contract:

***This way you can also mint an NFT. Minting an NFT for account#2 with account#1:***

- Type in **const accounts = await web3.eth.getAccounts();**

- After above type in **await spacebear.safeMint(accounts[1], "SpearBear.json");** - it automatically assumes you take the first account to send the transaction.

- Viewing the NFT Details, just type in **spacebear.ownerOf(0); spacebear.tokenURI(0);**

---

### UNIT TESTING WITH TRUFFLE

- **Testing consists basically of two different components:**

1. Execute a transaction (function call, etc.)

2. Compare the state on the blockchain or the transaction result to an expected value

---

##### Let's stick to the JavaScript tests, as they are very similar to Hardhat.

- create a new file **[Spacebear.test.js](./test/Spacebear.test.js)** in the test folder, check copy of codes in same folder

**Contents of Spacebear.test.js**

---

1. import the Spacebear artifact.

2. Start a test with the contract function, by using the contract function instead of describe, Truffle will automatically redeploy the contracts based on the migrations files to offer so called "clean room testing".

3. The contract function gets all accounts, which are injected by Truffle by doing a ***web3.eth.getAccounts()*** before starting the test.

4. Each test starts with the it(...) function, which expects a function as second parameter.

- Then in the opened truffle(ganache) console simply type in **test**

- Use each test code in the **[Spacebear.test.js](./test/Spacebear.test.js)** by uncommenting each sets of code to perform a uint test

### USING TRUFFLE ASSERTIONS (LIBRARY)

#### This package adds additional assertions that can be used to test Ethereum smart contracts inside Truffle tests.

---

- Exit the truffle console

- In the console type in **npm install truffle-assertions** || Third code in Spacebear.test.js involves using truffle assertion

- test your code