// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
  SimpleStorage[] public listOfContracts;

  function createSimpleStorageContract() public {
    listOfContracts.push(new SimpleStorage());
  }

  function sfStore(uint256 _index, uint256 _favoriteNumber) public {
    // Address
    // ABI (technically a lie, you just need the function selector)
    // ABI - Application Binary Interface
    // SimpleStorage(address)
    SimpleStorage mySimpleStorage = SimpleStorage(listOfContracts[_index]);
    mySimpleStorage.store(_favoriteNumber);
  }

  function sfGet(uint256 _index) public view returns(uint256) {
    SimpleStorage mySimpleStorage = listOfContracts[_index];
    
    return mySimpleStorage.retrieve();
  }
}