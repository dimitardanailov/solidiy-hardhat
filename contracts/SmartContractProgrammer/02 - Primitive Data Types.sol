// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.18;

contract Primitives {
  bool public boo = true;

  /**
   * uint stands for unsigned integer,
   * meaning non negative integers
   * different sizes are available
   * - uint8 - ranges from 0 to 2 ** 8 - 1
   * - uint16 - ranges from 0 to 2 ** 16 - 1
   * ...
   * - uint256 ranges from 0 to 2 ** 256 - 1
   */
  uint8 public u8 = 1;
  uint public u256 = 456;
  uint public u = 123; // uint alias for uint256

  // Default values
  // Unassigned variables have a default value
  bool public defaultBoo; // false
  bool public 
}