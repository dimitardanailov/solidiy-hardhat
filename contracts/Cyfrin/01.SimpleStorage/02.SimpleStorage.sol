// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.18;

contract SimpleStorage {
  uint256 favoriteNumber; // 0

  function store(uint256 _favoriteNumber) public {
    favoriteNumber = _favoriteNumber;
  }

  function retrieve() public view returns(uint256) {
    return favoriteNumber;
  }
}