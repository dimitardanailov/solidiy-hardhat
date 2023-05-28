// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.18;

contract Counter {
  bool paused;
  uint count;

  function setPause(bool _paused) external {
    paused = _paused;
  }

  modifier whenNotPaused() {
    require(!paused, "paused");
    _;
  }

  function inc() external whenNotPaused {
    count += 1;
  }

  function dec() external whenNotPaused {
    count -= 1;
  }

  modifier cap(uint _x) {
    require(_x < 100, "x >= 100");
    _;
  }

  function incBy(uint _x) external whenNotPaused cap(_x) {
    count += _x;
  }
}