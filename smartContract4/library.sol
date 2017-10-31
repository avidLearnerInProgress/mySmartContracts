pragma solidity 0.4.18;

/*
Start with solc 0.4.17, constant is depricated in favor of two new and more specific modifiers.
View This is generally the replacement for constant. It indicates that the function will not alter the storage state in any way
Pure This is even more restrictive, indicating that it won't even read the storage state.
A pure function might look something like this very contrived example:
function returnTrue() public pure returns(bool response) {
    return true;
}
In Remix, you'll get a warning when you use the old constant modifier. It will examine the function code and indicate the maximum restrictiveness you can safely apply.
*/


library Support {
    
    function increment(uint _self) pure public returns (uint)  {
        return _self+1;
    }
    
    function decrement(uint _self) pure public returns (uint)  {
        return _self-1;
    }
    
    function incrementByValue(uint _self, uint _value) pure public  returns (uint)  {
        return _self + _value;
    }
    
    function decrementByValue(int _self, int _value) pure public returns (int)  {
        return _self - _value;
    }
} 