// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.18;

contract MyContract {
  string public value;
  string private secret;

  event ConsoleLog(string _message);

  constructor(string memory _value, string memory _secret) {
    value = _value;
    secret = _secret;

    emit ConsoleLog(_value);
  }
}