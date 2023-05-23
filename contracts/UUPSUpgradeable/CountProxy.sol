// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.18;

import {ERC1967Proxy} from '@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol';

import {CountFly} from './CountFly.sol';

contract CountProxy is ERC1967Proxy {
  constructor(
    address _implementation, 
    uint256 _number
  ) 
    ERC1967Proxy(
      _implementation, 
      abi.encodeWithSelector(CountFly.initialize.selector, _number)
    ) 
  {}

  function upgrade(uint256 _number) external {
    CountFly _fly = new CountFly();
    _upgradeToAndCallUUPS(
      address(_fly), 
      abi.encodeWithSelector(
        CountFly.upgrade.selector, 
        _number, 
        _fly._VERSION()
      ), 
      false
    );
  }
}

function createFly(uint256 _number) returns (CountFly) {
  CountFly _fly = new CountFly();
  CountProxy _proxy = new CountProxy(address(_fly), _number);

  return CountFly(address(_proxy));
}