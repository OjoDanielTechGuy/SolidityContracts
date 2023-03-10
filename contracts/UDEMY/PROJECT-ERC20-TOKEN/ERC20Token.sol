// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

/**OpenZeppelin has a convenient Contract-Wizard on their Website
* - which can be use to generate token samples
* If you want to use the token template for your own token, you can do 
* - that easily by just importing and extending that ERC20 base contract.
*/

//importing smart contract from openZeppelin
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract ERC20CoffeeToken is ERC20, AccessControl {

    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    event CoffeePurchased(address indexed receiver, address indexed buyer);

    constructor() ERC20("ERC20CoffeeToken", "ECT") {

        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MINTER_ROLE, msg.sender);

    }

    //an internal function can be called internally from the smart contract
    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount);
    }

    function buyOneCoffe() public {
        _burn(_msgSender(), 1); //burn from msg.sender
        emit CoffeePurchased(_msgSender(), _msgSender());
    }

    //function to buy Coffee from an address
    function buyOneCoffeFrom(address _account) public {
        _spendAllowance(_account, _msgSender(), 1);
        _burn(_account, 1);
        emit CoffeePurchased(_msgSender(), _account);
    }
}