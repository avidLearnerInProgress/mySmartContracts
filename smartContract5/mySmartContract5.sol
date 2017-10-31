pragma solidity ^0.4.18;

contract transaction{
    
    //communitcate with transaction using payable fallback function
    
    //event logging mechanism
    event SenderLogger(address);
    event ValueLogger(uint);
    
    address private owner;
    
    modifier isOwner {
        require(owner == msg.sender);
        _;
    }
    
    modifier validValue {
        assert(msg.value >= 1 ether);
        _;
    }
    
    function Transaction() public{
        owner = msg.sender;
    }
    
    //Fallback functions are triggered when the function signature does not match any of the available functions in a Solidity contract
    function () payable isOwner validValue public{
        SenderLogger(msg.sender);
        ValueLogger(msg.value);
    }
    
}