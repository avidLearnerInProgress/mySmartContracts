pragma solidity ^0.4.18;

interface Regulator{
    function checkValue(uint amount) public returns (bool);
    function loan() public returns (bool);
}

contract Bank is Regulator {
    uint private value;
    address private owner;  //owner of contract
    
    // 3 ways of  exception handling 
    // throw; it is deprecated
    //assert()
    //require()
    
    
    modifier ownerFunc{  //modifier is owner based functionality
        require(owner==msg.sender); //exception handling 
        _; 
        // entry point for function;
        //basically when we apply ownerFunc modifier to function, require() will be executed first then the function execution starts.
    }
    
    //to test this function properly, try to create run using one address and then deposit and withdraw with other address, the actual balance wont change
    // although the ether will be reduced
    
    function Bank(uint amount) public{  
        value=amount;
        owner=msg.sender;
    }
    
    function deposit(uint amount) ownerFunc public{
        value+=amount;
    }
    
    function withdraw(uint amount) ownerFunc public{
        if (checkValue(amount)) {
            value-=amount;
        }
    }
    
    function balance() public constant returns (uint){
        return value;
    }
    
    function checkValue(uint amount) public returns (bool){
        return value >= amount;
    }
    
    function loan() public returns (bool){
        return value > 0;
    }
}


contract MyFirstContract is Bank(10) {
    string private name;
    uint private age;
    
    function setName(string newName) public {
        name = newName;
    }
    
    function getName() private constant returns (string) {
        return name;
    }
    
    function setAge(uint newAge) public{
        age = newAge;
    }
    
    function getAge() private constant returns (uint) {
        return age;
    }
}



contract TestThrows {
    function testAssert() pure public{
        assert(1 == 2); //validating functional inputs at runtime
        
        // gas consumed on message sent always.
        //no opcode thrown
    }
    
    function testRequire() pure public{
        require(2 == 1); //gas consumed on message 
        
        // opcode thrown when gas consumed 
    }
    
    function testRevert() pure public{
        revert(); //gas reverted
    }
    
    function testThrow() pure public{
        throw;  //consumes gas completely
    }
}


/*
Use require() to:

Validate user inputs
Validate the response from an external contract
ie. use require(external.send(amount))
Validate state conditions prior to executing state changing operations, for example in an owned contract situation
Generally, you should use require more often,
Generally, it will be used towards the beginning of a function.

Use assert() to:

check for overflow/underflow
check invariants
validate contract state after making changes
avoid conditions which should never, ever be possible.
Generally, you should use assert less often
Generally, it will be use towards the end of your function.

*/
