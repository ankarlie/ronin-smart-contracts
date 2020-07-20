pragma solidity ^0.5.2;

import "@axie/contract-library/contracts/token/erc20/ERC20Mintable.sol";
import "./IWETH.sol";


contract WETHDev is IWETH, ERC20Mintable {

  event Deposit(
    address sender,
    uint256 value
  );

  event Withdrawal(
    address sender,
    uint256 value
  );

  function deposit() external payable {
    balanceOf[msg.sender] += msg.value;

    emit Deposit(msg.sender, msg.value);
  }

  function withdraw(uint256 wad) external {
    require(balanceOf[msg.sender] >= wad);
    balanceOf[msg.sender] -= wad;
    msg.sender.transfer(wad);

    emit Withdrawal(msg.sender, wad);
  }
}
