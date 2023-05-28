// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.18;

enum Status {
  None,
  Pending,
  Shipped,
  Completed,
  Rejected,
  Canceled
}

struct Order {
  address buyer;
  Status status;
}

contract Enum {
  Status public status;
  Order[] public orders;

  function get() view external returns (Status) {
    return status;
  }

  function set(Status _status) external {
    status = _status;
  }

  function ship() external {
    status = Status.Shipped;
  }

  function reset() external {
    delete status;
  }
}