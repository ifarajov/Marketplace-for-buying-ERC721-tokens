pragma solidity ^0.6.0;

import "./Roles.sol";
/**
 * This is an access control role for entities that may spend tokens
 */
contract SpenderRole {
  using Roles for Roles.Role;

  event SpenderAdded(address indexed account);
  event SpenderRemoved(address indexed account);

  Roles.Role private spenders;

  constructor() internal {
    _addSpender(msg.sender);
  }

  modifier onlySpender() {
    require(isSpender(msg.sender),"");
    _;
  }

  function isSpender(address account) public view returns (bool) {
    return spenders.has(account);
  }

  function addSpender(address account) public onlySpender {
    _addSpender(account);
  }

  function renounceSpender() public {
    _removeSpender(msg.sender);
  }

  function _addSpender(address account) internal {
    spenders.add(account);
    emit SpenderAdded(account);
  }

  function _removeSpender(address account) internal {
    spenders.remove(account);
    emit SpenderRemoved(account);
  }
}