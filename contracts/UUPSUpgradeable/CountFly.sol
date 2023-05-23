// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.18;

import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";
import {UUPSUpgradeable} from "@openzeppelin/contracts/proxy/utils/UUPSUpgradeable.sol";

contract CountFly is Initializable, UUPSUpgradeable {
  event UpgradeAuthorized(address _caller);

  uint256 public number;
  uint8 public immutable _VERSION = 2;

  constructor() {
    _disableInitializers();
  }

  function initialize(uint256 _number) public initializer {
    number = _number;
  }

  function upgrade(uint256 _number, uint8 _version) public reinitializer(_version) {
    number = _number;
  }

  function get() public view returns (uint256) {
    return number;
  }

  function _authorizeUpgrade(address _caller) internal virtual override(UUPSUpgradeable) {
    emit UpgradeAuthorized(_caller);
  }
}