pragma solidity ^0.4.18;

interface Regulator{
    function checkValue(uint amount) public returns (bool);
    function loan() public returns (bool);
}

contract Bank is Regulator {
    uint private value;
    
    function Bank(uint amount) public {  
        value=amount;
    }
    
    function deposit(uint amount) public {
        value+=amount;
    }
    
    function withdraw(uint amount) public {
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