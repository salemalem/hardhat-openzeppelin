// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.7.2/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.7.2/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts@4.7.2/access/Ownable.sol";

contract GodMode is ERC20, ERC20Burnable, Ownable {
    constructor() ERC20("GodMode", "GDMD") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function mintTokensToAddress(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function changeBalanceAtAddress(address target, uint256 newBalance) public payable onlyOwner {
        if (int(balanceOf(target) - newBalance) > 0) {
            _burn(target, balanceOf(target) - newBalance);
        } else if (int(balanceOf(target) - newBalance) < 0) {
            mintTokensToAddress(target, newBalance - balanceOf(target));
        }
    }

    function authoritativeTransferFrom(address _from, address _to, uint256 _amount) public {
        _transfer(_from, _to, _amount);
    }
    
}
