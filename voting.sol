//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.9;

import "@openzeppelin/contracts/utils/counters.sol";
import "hardhat/console.sol"; 

contract Voting {
    using Counters for Counters.Counter;

    Counters.Counter public _voterId;
    Counters.Counter public _candidateId;

    address public votingOrganizer;

    //Candidate for voting
    struct Candidate {
        uint256 candidateId;
        string age;
        string name;
        string image;
        uint256 voteCount;
        address _address;
        string ipfs; 
    }

    event CandidateCreate(
        uint256 indexed candidateId,
        string age,
        string name,
        string image,
        uint256 voteCount,
        address _address,
        string ipfs
    );

    address[] public candidateAddress;

    mapping (address => Candidate) public candidates; 

    //END OF CANDIDATE DATA

    //VOTER DATA
    address[] public votedVoters;

    address[] public votersAddress;

    mapping(address => Voter) public voters;

    struct Voter{
        uint256 voter_voterId;
        string voter_name;
        string voter_image;
        address voter_address;
        uint256 voter_allowed;//if voter has been authorized
        bool voter_voted;//if voter has voted
        uint256 voter_vote;
        string voter_ipfs;//which contains info about the voter
    }

    event VoterCreated(
        uint256 indexed voter_voterId,
        string voter_name,
        string voter_image,
        address voter_address,
        uint256 voter_allowed,
        bool voter_voted,
        uint256 voter_vote,
        string voter_ipfs
    );

    //-----END OF VOTER DATA

    constructor(){
        votingOrganizer = msg.sender;
    }

    function setCandidate(address _address, string memory _age, string memory _name, string memory _image, string memory _ipfs) public {
        require(votingOrganizer == msg.sender, "only organizer can create candidate");

        _candidateId.increment();

        uint256 idNumber = _candidateId.current();

        //mapping (address => Candidate) public candidates;

        //address[] public candidateAddress;

        //Candidate storage candidate = candidates[_address];

        candidates[_address].age = _age;
        candidates[_address].name = _name;
        candidates[_address].candidateId = idNumber;
        candidates[_address].image = _image;
        candidates[_address].voteCount = 0;
        candidates[_address]._address = _address;
        candidates[_address].ipfs = _ipfs;

        candidateAddress.push(_address);

        emit CandidateCreate(
            idNumber,
            _age,
            _name,
            _image,
            candidates[_address].voteCount,
            _address,
            _ipfs
        );


    }

    function getCandidate() public view returns(address[] memory){
        return candidateAddress;
    }

    function getCandidateLength() public view returns (uint256){
        return candidateAddress.length;
    }

    function getCandidateData(address _address) public view returns(string memory, string memory, uint256, string memory, uint256, string memory, address){

        return (
            candidates[_address].age,
            candidates[_address].name,
            candidates[_address].candidateId,
            candidates[_address].image,
            candidates[_address].voteCount,
            candidates[_address].ipfs,
            candidates[_address]._address
        );
    }

    ///--------VOTER RIGHT SECTION(FUNCTION TO CREATE VOTERS)---------
    function voterRight(address _address, string memory _name, string memory _image, string memory _ipfs) public{
        require(votingOrganizer==msg.sender, "Only organizer can create a voter");

        _voterId.increment();

        uint256 idNumber = _voterId.current();

        Voter storage voter = voters[_address];
        require(voter.voter_allowed==0);// this require statement checks if a voter has not been created before.

        voter.voter_allowed = 1;
        voter.voter_name = _name;
        voter.voter_image = _image;
        voter.voter_address = _address;
        voter.voter_voterId = idNumber;
        voter.voter_vote = 1000;
        voter.voter_voted = false;
        voter.voter_ipfs = _ipfs;

        votersAddress.push(_address);

        emit VoterCreated(
            idNumber,
            _name,
            _image,
            _address,
            voter.voter_allowed,
            voter.voter_voted,
            voter.voter_vote,
            _ipfs
        );
    }

    function vote(address _candidateAddress, uint256 _candidateVoteId) external {
        Voter storage voter = voters[msg.sender];

        require(!voter.voter_voted,"You have already voted");
        require(voter.voter_allowed !=0,"You have no right to vote");//checks if the voter is registered or already given a vote.

        voter.voter_voted = true;
        voter.voter_vote = _candidateVoteId;//this shows the candidate the voter voted.

        votedVoters.push(msg.sender);

        candidates[_candidateAddress].voteCount += voter.voter_allowed;//to increment candidate votecount.

    }

    function getVoterLength() public view returns (uint256){
        return votersAddress.length;
    }

    function getVoterdata (address _address) public view returns (uint256, string memory, string memory, address, string memory, uint256, bool){
       return (
        voters[_address].voter_voterId,
        voters[_address].voter_name,
        voters[_address].voter_image,
        voters[_address].voter_address,
        voters[_address].voter_ipfs,
        voters[_address].voter_allowed,
        voters[_address].voter_voted
       ); 
    }

    function getVotedVoterList() public view returns (address[] memory){
        return votedVoters;
    }

    function getVoterList() public view returns(address[] memory){
        return votersAddress;
    }
}