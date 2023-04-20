// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

/** -- Understanding the ERC721 Token --
==================================
* The ERC721 is an ERC20 token where each token has a unique ID and can have an URL for more MetaData.
* The initial token standard came from the Ethereum Request for Comments number 721 and simply
* - summarizes it as "A standard interface for non-fungible tokens, also known as deeds."
===============================
* -- The Token ID --
* The simplest method to determine the token ID is to increment a counter when a new token is minted
* - and each token is represented by a unique uint256 value
===============================
* -- MetaData --
* Each NFT contract can optionally add the MetaData extension.
* In reality, most have. The extension defines that a json file is downloaded at a specific URI.
*
==============================
* This code is extracted via "https://docs.openzeppelin.com/contracts/4.x/wizard"
* - using ERC721 contract wizard to implement required code section
* - Features: Mintable, Auto IncrementIds, URI Storage, Ownable.
*/

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

//debugging via console.log
import "@ganache/console.log/console.sol";

// contract SpaceBear is ERC721, ERC721URIStorage, Ownable {
contract SpaceBear is ERC721, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("SpaceBear", "SBR") {}

    function _baseURI() internal pure override returns (string memory) {
        return "https://ethereum-blockchain-developer.com/2022-06-nft-truffle-hardhat-foundry/nftdata/";
    }

    // function safeMint(address to, string memory uri) public onlyOwner {
    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        // _setTokenURI(tokenId, uri);
    }

    /*new function added for buyToken
    buyToken function, which get 0.1 ether for the first token, 0.2 ether for the second token, etc*/
    function buyToken() public payable {
        uint256 tokenId = _tokenIdCounter.current();

        //code added for debugging through console
        console.log("got here", tokenId, msg.value);

        // require(msg.value == tokenId * 0.1 ether, "Funds not available for transaction");

        //fixing error when console shows the tokenId as null
        require(msg.value == (tokenId + 1) * 0.1 ether, "Funds not available for transaction");

        _tokenIdCounter.increment();
        _safeMint(msg.sender, tokenId);
    }

    // The following functions are overrides required by Solidity.

    function _burn(uint256 tokenId) internal override(ERC721) {
    // function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        // view
        pure
        // override(ERC721, ERC721URIStorage)
        override(ERC721)
        returns (string memory)
    {
        // return super.tokenURI(tokenId);                
        return string (abi.encodePacked(_baseURI(), "_", tokenId + 1, ".json"));
    }
}

//Then mint one token with the uri being "spacebear_1.json", 
//so it will resolve to "https://ethereum-blockchain-developer.com/2022-06-nft-truffle-hardhat-foundry/nftdata/spacebear_1.json"