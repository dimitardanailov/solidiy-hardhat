// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

contract FundMe {
  function fund() public payable {
    // Allow users to send $
    // Have a minimum $ sent
    // 1. How do we send ETH to this contract?
    require(msg.value > 1e18, "didn't send enough wei"); // 1e18 = 1 ETH
  }
  function withdraw() public {}
}