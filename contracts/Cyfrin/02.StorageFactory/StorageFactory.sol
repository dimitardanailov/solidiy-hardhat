// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import "./SimpleStorage.sol";

contract StorageFactory {
  SimpleStorage public simpleStorage;

  function createSimpleStorageContract() public {
    simpleStorage = new SimpleStorage();
  }
}