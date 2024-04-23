// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

// reference: https://docs.chain.link/data-feeds/historical-data
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
  function getPriceFeed() internal pure returns(AggregatorV3Interface) {
    address AggregatorV3InterfaceAddress = 0x694AA1769357215DE4FAC081bf1f309aDC325306;
    AggregatorV3Interface priceFeed = AggregatorV3Interface(AggregatorV3InterfaceAddress);

    return priceFeed;
  }

  function getPrice() internal view returns(uint256) {
    (,int256 answer,,,) = getPriceFeed().latestRoundData();

    return uint256(answer * 1e10);
  }

  function getConversationRate(uint256 ethAmount) internal view returns(uint256) {
    uint256 ethPrice = getPrice();
    uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;

    return ethAmountInUsd;
  }

  function getVersion() internal view returns (uint256) {
    return getPriceFeed().version();  
  }
}