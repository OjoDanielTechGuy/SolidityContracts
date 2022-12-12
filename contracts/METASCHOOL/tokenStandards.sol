//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.13;

/*importing openZeppelin library, 
Ownable ERC721 - includes basic definition for a contract*/

/*
ERC-1155 is a brand-new token standard that strives to combine the finest features 
of prior token standards to build a fungibility-agnostic, 
gas-efficient token contract. This standard eliminates the drawbacks and 
limitations of its predecessors and builds upon their success. 
The distinctive feature that makes it stand out is the fact that it uses a 
single smart contract to represent multiple types of tokens (both fungible and non-fungible) at once.
*/

// import "https://github.com/OpenZepplin/openzepplin-contracts/contracts/token/ERC721/ERC721.sol";
import "erc721a/contracts/ERC721A.sol";

//define name your contract, symbol(in the ERC721 constructor then inherit ERC721 -,
// contract Hellonft is ERC721("HelloNft", "HNFT") {
contract Hellonft is ERC721A("HelloNft", "HNFT") {
    
    uint tokenId; //tokenId is initialized to zero
    
    //mapping an address with a meta array
    mapping (address => tokenMetaData[]) public ownershipRecord;

    //tokenMetaData keeps token Id, timestamp and tokenURI of each token
    struct tokenMetaData {
        uint tokenId;
        uint timeStamp;
        string tokenURI;
    }

    //mint Function to an address of the receiver and using url of the asset(to mint)
    function mintToken(address recipient, string memory url) public {

    //miniting process (imported from the ERC721)
    _safeMint(recipient, tokenId);
    ownershipRecord[recipient].push(tokenMetaData(tokenId, block.timestamp, url));
    tokenId = tokenId + 1;
    }
}