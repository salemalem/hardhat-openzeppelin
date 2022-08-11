// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

import "@openzeppelin/contracts@4.7.2/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.7.2/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts@4.7.2/access/Ownable.sol";

contract BuySell is ERC20, ERC20Burnable, Ownable {
    constructor() ERC20("BuySell", "BYS") {}

    function mint(address to, uint256 amount) internal {
        _mint(to, amount);
    }
    function buy() public payable returns(uint256){
        require(msg.value * 1e18 + totalSupply() >= 1000000 * 1e18, "Supply can't exceeed 1 million tokens");
        mint(msg.sender, msg.value * 1e18);        
        return msg.value;
    }
    function withdraw() public payable onlyOwner {
        require(address(this).balance > 0, "Zero balance");
        payable(owner()).transfer(address(this).balance);
    }
    function ethBalance() public view returns(uint256){
        return address(this).balance;
    }
    function sellBack(uint256 amount) public payable {
        require(address(this).balance > amount / 1e18 / 2, "Zero balance");
        payable(msg.sender).transfer(amount / 1e18 / 2);
    }
}
