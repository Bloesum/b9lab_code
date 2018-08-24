pragma solidity 0.4.24;

contract Fool {
    
    function sendToNostradamus(address watch_addr) public returns(bytes32 exact, address sender, bool success) {
    
        uint blockNumber = block.number;
        bytes32 blockHash = blockhash(blockNumber);
        exact = keccak256(abi.encodePacked(address(this), blockNumber, blockHash, block.timestamp, watch_addr));
        success = watch_addr.call(bytes4(keccak256("prophecise(bytes32)")), exact);
        return (exact, msg.sender, success);
        }
        
    function () public payable {}
}