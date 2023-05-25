// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.18;

contract MyContract {
  string public value;

  /**
   * Question: Is accurate that private variables are truly private?
   * 
   * Answer: 
   * This is one of most popular Solidity interview questions.
   * The answer is No. Only the EVM has access to private information
   * (Ethereum Virtual Machine, the part of Ethereum that executes smart contracts).
   * On the other hand, smart contract data is stored on the Ethereum blockchain,
   * which is open to the world. Anyone can read secret variables of smart contracts
   * using a particular tool for analyzing blockchain data.
   */
  string private secret;

  constructor(string memory _value, string memory _secret) {
    value = _value;

    
    secret = _secret;
  }
}