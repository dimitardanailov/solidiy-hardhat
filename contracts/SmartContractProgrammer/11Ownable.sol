// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.18;

contract Ownable {
  address public owner;

  constructor() {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    require(msg.sender == owner, "not owner");
  }

  function setOwner(address owner) external onlyOwner {
    require(_newOwner != address(0), "invalid address");
    owner = _newOwner;
  }

  function onlyOwnerCanCallThisFunc() external onlyOwner {
    // code
  }
}