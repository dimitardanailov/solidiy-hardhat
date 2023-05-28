// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.18;

contract Array {
  uint[] public arr;
  uint[] public arr2 = [1,2,3];
  uint[10] public fixedArr;

  function get(uint i) public view returns (uint) {
    return arr[i];
  }

  function push(uint i) public {
    arr.push(i);
  }

  function pop() public {
    arr.pop();
  }

  function getLenght() public view returns(uint) {
    return arr.length;
  }

  function remove(uint index) public {
    // Delete does not change the array length.
    // It resets the value at index to it's default value,
    // in this case 0
    delete arr[index];
  }

  function memoryArr() public pure {
    // create array in memory, only fixed size can be created
    uint[] memory a = new uint[](5);
    a[0] = 2;
  }
}

contract ArrayReplaceFromEnd {
  uint[] public arr;

  function remove(uint index) public {
    arr[index] = arr[arr.length - 1];
    arr.pop();
  }

  function test() public {
    arr = [1, 2, 3, 4];
    
    //remove
    remove(1); // [1, 4, 3];

    assert(arr.length == 3);
    assert(arr[0] == 1);
    assert(arr[1] == 4);
    assert(arr[2] == 3);

    remove(2);
    // [1, 4]
    assert(arr.length == 2);
    assert(arr[0] == 1);
    assert(arr[1] == 4);
  }
} 