// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract Currency is ERC20 {
    address private owner;
    
    constructor(uint256 initialSupply) ERC20("Currency", "CUR") public {
        _mint(msg.sender, initialSupply);
        owner = msg.sender;
    }

}