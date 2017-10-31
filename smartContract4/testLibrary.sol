pragma solidity 0.4.18;
import "browser/library.sol";

contract UseLibrary {
    using Support for uint;
    
    function testIncrement(uint _base) pure public returns (uint) {
        return Support.increment(_base);
    }
    
    function testDecrement(uint _base) pure public returns (uint) {
        return Support.decrement(_base);
    }
    
    function testIncrementByValue(uint _base, uint _value) pure public returns (uint) {
        return _base.incrementByValue(_value);
    }
    
    function testDecrementByValue(uint _base, uint _value) pure public returns (uint) {
        return _base.decrementByValue(_value);
    }
}


