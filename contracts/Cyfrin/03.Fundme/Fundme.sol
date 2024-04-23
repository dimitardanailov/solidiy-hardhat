// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {
  using PriceConverter for uint256;

  uint256 public minimumUsd = 5e18;
  address[] public funders;
  mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

  address public owner;

  constructor() {
    owner = msg.sender;
  }

  function fund() public payable {
    // Allow users to send $
    // Have a minimum $ sent
    // 1. How do we send ETH to this contract?
    require(msg.value.getConversationRate() > minimumUsd, "didn't send enough ETH"); // 1e18 = 1 ETH

    // What's a revert ?
    // Undo any actions that have been done, adnd send the remaining gas back
    funders.push(msg.sender);
    addressToAmountFunded[msg.sender] += msg.value;
  }

  function withdraw() public onlyOwner {
    for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
      address funder = funders[funderIndex];
      addressToAmountFunded[funder] = 0;
    }

    funders = new address[](0);

    // transfer
    payable(msg.sender).transfer(address(this).balance);

    // send
    bool sendSuccess = payable(msg.sender).send(address(this).balance);
    require(sendSuccess, "send failed");

    // call
    (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
    require(callSuccess, "call failed");
  }

  modifier onlyOwner() {
    require(msg.sender == owner, "Sender is not owner!");
    _;
  }
}