// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {
  using PriceConverter for uint256;

  uint256 public minimumUsd = 5e18;
  address[] public funders;
  mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

  function fund() public payable {
    // Allow users to send $
    // Have a minimum $ sent
    // 1. How do we send ETH to this contract?
    require(msg.value.getConversationRate() > minimumUsd, "didn't send enough ETH"); // 1e18 = 1 ETH

    // What's a revert ?
    // Undo any actions that have been done, adnd send the remaining gas back
    funders.push(msg.sender);
    addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
  }
  function withdraw() public {}
}