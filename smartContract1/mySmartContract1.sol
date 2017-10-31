pragma solidity ^0.4.0;

contract myFirstContract{  
	string private name;  //type accessmodifier var-name

	unit private age; //unsigned 

	function setName(string newName){
		name=newName;
	}

	function getName() return (string){
		return name;
	}


}
