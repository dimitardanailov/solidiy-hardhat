// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

// reference: https://docs.chain.link/data-feeds/historical-data
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {
  uint256 public minimumUsd = 5e18;
  address AggregatorV3InterfaceAddress = 0x694AA1769357215DE4FAC081bf1f309aDC325306;
  address[] public funders;

  function fund() public payable {
    // Allow users to send $
    // Have a minimum $ sent
    // 1. How do we send ETH to this contract?
    require(getConversationRate(msg.value) > minimumUsd, "didn't send enough ETH"); // 1e18 = 1 ETH

    // What's a revert ?
    // Undo any actions that have been done, adnd send the remaining gas back
    funders.push(msg.sender);
  }
  function withdraw() public {}

  function getPrice() public view returns(uint256) {
    AggregatorV3Interface priceFeed = AggregatorV3Interface(AggregatorV3InterfaceAddress);
    (,int256 answer,,,) = priceFeed.latestRoundData();

    return uint256(answer * 1e10);
  }

  function getConversationRate(uint256 ethAmount) public view returns(uint256) {
    uint256 ethPrice = getPrice();
    uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;

    return ethAmountInUsd;
  }

  function getVersion() public view returns (uint256) {
    return AggregatorV3Interface(AggregatorV3InterfaceAddress).version();  
  }
}