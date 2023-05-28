// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Account {
  uint public balance;
  uint public constant MAX_UNIT = 2 ** 256 - 1;

  function deposit(uint _amount) public {
    uint oldBalance = balance;
    uint newBalance = balance + _amount;

    // balance + amount doesnt overflow if balance + _amount >= balance
    require(newBalance >= oldBalance, "Overflow");

    balance = newBalance;

    assert(balance >= oldBalance);
  }

  function withdraw(uint _amount) public {
    uint oldBalance = balance;

    // balance - _amount does not underflow if balance >= _amount
    require(balance >= _amount, "Underflow");

    if (balance < _amount) {
      revert("Underflow");
    }

    balance -= _amount;
    assert(balance <= oldBalance);
  }
}