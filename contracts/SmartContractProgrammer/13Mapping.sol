// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.18;

// Maps are created with the syntax mapping(keyType => valueType).
// 
// The keyType can be any built-in value type, 
// bytes, string or any contract;
// 
// valueType can be any type including another mapping or an array
// 
// Mapping are not iterable

contract Mapping {
  // Mapping from address to uint
  mapping(address => uint) public myMap;

  function get(address _addr) public view returns (uint) {
    // Mapping always return a value
    // If value the value was never set, 
    // it will return the default value.
    return myMap[_addr];
  }

  function set(address _addr, uint _i) public {
    // Update the value at this address
    myMap[_addr] = _i;
  }

  function remove(address _addr) public {
    // Reset the value to the default value.
    delete myMap[_addr];
  }
}

contract NestedMapping {
  // Nested mapping (mapping from address to another mapping)
  mapping(address => mapping(uint => bool)) public nested;

  function get(address _addr, uint _i) public view returns (bool) {
    // You can get values from a nested mapping
    // even when it is not initialized
    return nested[_addr][_i];
  }

  function set(address _addr, uint _i, bool _value) public {
    nested[_addr][_i] = _value;
  }

  function remove(address _addr, uint _i) public {
    delete nested[_addr][_i];
  }
}

contract IterableMapping {
  mapping(address => uint) public balances;
  mapping(address => bool) public inserted;
  address[] keys;

  function set(address _key, uint _val) external {
    balances[_key] = _val;

    if (!inserted[_key]) {
      inserted[_key] = true;
      keys.push(_key);
    }
  }

  function getSize() external view returns (uint) {
    return keys.length;
  }

  function first() external view returns (uint) {
    return balances[keys[0]];
  }
}