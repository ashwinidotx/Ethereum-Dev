pragma solidity ^0.4.2;
// 0.4.11 - old
contract Election {
	//1.Model Candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }
    // also, Store accounts that have voted.
    mapping(address => bool) public voters;
    //2.Store Candidate
    //3.Fetch Candidate info
    mapping (uint => Candidate) public candidates;
    //4.Store Candidate count(votes)
    uint public candidatesCount;
    
    function Election () public {
        addCandidate("Abinash");
        addCandidate("Ashwini");
    }

    function addCandidate(string _name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote(uint _candidateId) public {
        // require user havent voted before.
        require(!voters[msg.sender]);
        //require a valid candidate.
        require(_candidateId>0 && _candidateId<=candidatesCount);
        // record that the votes has voted (once)truff.
        voters[msg.sender] = true;
        // update cand vote count.
        candidates[_candidateId].voteCount++;
    }
}