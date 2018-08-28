pragma solidity 0.4.24;

import './Nostradamus.sol';

contract Fool {
    
    function sendToNostradamus(address watch_addr) public {
    
        uint blockNumber = block.number;
        bytes32 blockHash = blockhash(blockNumber);
        bytes32 exact = keccak256(abi.encodePacked(address(this), blockNumber, blockHash, block.timestamp, watch_addr));
        Nostradamus nostradamus = Nostradamus(watch_addr);
        return nostradamus.prophecise(exact);
        }
}