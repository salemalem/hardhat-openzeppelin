// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.7.2/token/ERC20/ERC20.sol";

contract SanctionCoin is ERC20 {
    mapping(address=>bool) private _sanctionedAddresses;

    constructor() ERC20("SanctionCoin", "SNC") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    modifier onlyAllowed {
        require(_sanctionedAddresses[msg.sender] == false, "Your account is sanctioned!");
        _;
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount) override internal onlyAllowed {
        require(_sanctionedAddresses[from] == false, "Your account is sanctioned!");
        require(_sanctionedAddresses[to]   == false, "Recepient address is sanctioned!");
        super._beforeTokenTransfer(from, to, amount);
    }

    function lockAddress(address account) public returns(bool success) {
        _sanctionedAddresses[account] = true;
        return true;
    }
    function unlockAddress(address account) public returns(bool success) {
        _sanctionedAddresses[account] = false;
        return true;
    }
    function viewAddressStatus(address account) public view returns(bool status) {
        return _sanctionedAddresses[account];
    }
}
