//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.13;

/*importing openZeppelin library, 
Ownable ERC721 - includes basic definition for a contract*/

import "https://github.com/OpenZepplin/openzepplin-contracts/contracts/token/ERC721/ERC721.sol";

//define name your contract, symbol(in the ERC721 constructor then inherit ERC721,
contract Hellonft is ERC721("HelloNft", "HNFT") {
    
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