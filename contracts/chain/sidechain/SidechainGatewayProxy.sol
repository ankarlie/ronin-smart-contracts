pragma solidity ^0.5.17;

import "@axie/contract-library/contracts/proxy/Proxy.sol";
import "./SidechainGatewayStorage.sol";
import "../common/Validator.sol";
import "../common/Registry.sol";


contract SidechainGatewayProxy is Proxy, SidechainGatewayStorage {
  constructor(address _proxyTo, address _registry, uint256 _maxPendingWithdrawal)
    public
    Proxy(_proxyTo)
  {
    registry = Registry(_registry);
    maxPendingWithdrawal = _maxPendingWithdrawal;
  }
}
