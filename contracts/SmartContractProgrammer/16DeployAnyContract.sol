// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.18;

contract Proxy {
  event Deploy(address);

  function deploy(bytes memory _code) external payable returns (address addr) {
    assembly {
      // create(v, p, n)
      // v = amount of ETH to send
      // p = pointer in memory to start of code
      // n = size of code
      addr := create(callvalue(), add(_code, 0x20), mload(_code))
    }

    require(addr != address(0), "deploy failed");
  }
}

contract TestContract1 {
    address public owner = msg.sender;

    function setOwner(address _owner) public {
        require(msg.sender == owner, "not owner");
        owner = _owner;
    }
}

contract TestContract2 {
  address public owner = msg.sender;
  uint public value = msg.value;
  uint public x;
  uint public y;

  constructor(uint _x, uint _y) payable {
      x = _x;
      y = _y;
  }
}

contract Helper {
  function getBytecode1() external pure returns (bytes memory) {
    bytes memory bytecode = type(TestContract1).creationCode;

    return bytecode;
  }

  function getBytecode2() external pure returns (bytes memory) {
    bytes memory bytecode = type(TestContract2).creationCode;

    return bytecode;
  }

  function getCalldata(address _owner) external pure returns (bytes memory) {
    return abi.encodeWithSignature("setOwner(address)", _owner);
  }
}