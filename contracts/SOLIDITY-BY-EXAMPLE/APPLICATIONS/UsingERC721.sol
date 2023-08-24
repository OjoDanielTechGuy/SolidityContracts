/***ERC721 - Ethereum Request for Comment 721 introduces standard NFT.
- This type of token is unique and can have different value than another Token from the same 
Smart Contract*/

//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

//creating interface
interface IERC165 {
    function supportsInterface(bytes4 interfaceID) external view returns (bool);
}

//interface IERC721 inherting from the first interface IERC165
interface IERC721 is IERC165 {
    function balanceOf(address owner) external view returns (uint256 balance); //check balance of address

    function ownerOf(uint256 tokenId) external view returns (address owner); //returns the address of the owner of the token

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external; //transfer token

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes calldata data
    ) external;

    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    function approve(address to, uint256 tokenId) external;

    //this returns the address of the operator after inserting the tokenId to get approval
    function getApproval(uint256 tokenId)
        external
        view
        returns (address operator);

    //setting approval for all operator
    function setApprovalForAll(address operator, bool _approved) external;

    //checking for approval of a operator
    function isApprovedForAll(address owner, address operator)
        external
        view
        returns (bool);
}

//interface
interface IERC721Receiver {

    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes calldata data
    ) external returns (bytes4);
}

contract ERC721 is IERC721 {
    //setting event for outside activity
    event Transfer(
        address indexed from,
        address indexed to,
        uint256 indexed id
    );

    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 indexed id
    );
    
    event ApproveForAll(
        address indexed owner,
        address indexed operator,
        bool approved
    );

    //mapping number value(tokenID) to an owner address
    mapping(uint256 => address) internal _ownerOf;
    //Mapping owner address to token amount
    mapping(address => uint256) internal _balanceOf;
    //mapping from tokenIdd to  approve address to be used
    mapping(uint256 => address) internal _approvals;
    //mapping from owner to operator approvals
    mapping(address => mapping(address => bool)) public isApprovedForAll;

    function supportsInterface(bytes4 interfaceId)
        external
        pure
        returns (bool)
    {
        return
            interfaceId == type(IERC721).interfaceId ||
            interfaceId == type(IERC165).interfaceId;
    }

    function approve(address spender, uint256 id) external {
        address owner = _ownerOf[id];
        require(
            msg.sender == owner || isApprovedForAll[owner][msg.sender],
            "Not authorized"
        );

        _approvals[id] = spender;

        //emitting event
        emit Approval(owner, spender, id);
    }

    //getting approval and confirmation that it exist
    function getApproved(uint256 id) external view returns (address) {
        require(_ownerOf[id] != address(0), "token does not exist");
        return _approvals[id];
    }

    function _isApprovedOrOwner(
        address owner,
        address spender,
        uint256 id
    ) internal view returns (bool) {
        return
            (spender == owner) ||
            isApprovedForAll[owner][spender] ||
            spender == _approvals[id];
    }

    function transferFrom(address from, address to, uint id) public {

        require(from == _ownerOf[id], "It is not from owner");
        require(to != address(0), "transfer to zero address not allowed");
        require(_isApprovedOrOwner(from, msg.sender, id), "not authorized");

        _balanceOf[from]--;
        _balanceOf[to]++;
        _ownerOf[id] = to;

        delete _approvals[id];
        emit Transfer(from, to, id);
    }

    function safeTransferFrom(address from, address to, uint id) external {
        transferFrom(from, to, id);

        require(to.code.length == 0 || IERC721Receiver(to).onERC721Received(msg.sender, from, id, "") ==
            IERC721Receiver.onERC721Received.selector, "unsafe recipient");
    }

    function safeTransferFrom(address from, address to, uint id, bytes calldata data) external {
        transferFrom(from, to, id);

        require(to.code.length == 0 || IERC721Receiver(to).onERC721Received(msg.sender, from, id, data) ==
            IERC721Receiver.onERC721Received.selector, "unsafe recipient");
    }

    //minting a token
    function _mint(address to, uint id) internal  {
        require(to != address(0), "mint to zero address");
        require(_ownerOf[id] == address(0), "token already minted");

        _balanceOf[to]++;
        _ownerOf[id] = to;

        emit Transfer(address(0), to, id);
    }

    //burning a token hence reducing
    function _burn(uint id) internal {
        address owner = _ownerOf[id];
        require(owner != address(0), "not minted");

        _balanceOf[owner] -= 1;

        delete _ownerOf[id];
        delete _approvals[id];

        emit Transfer(owner, address(0), id);
    }
}

contract MyNFT is ERC721 {
    function mint(address to, uint id) external {
        _mint(to, id);
    }
}
