// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./User.sol";

contract Lender is User {
    uint public totalDeposits;
    constructor(string memory _username, address _userAddress) 
        User(_username, _userAddress) {}

    function depositFunds(uint amount) public {
        totalDeposits += amount;
    }

    function performAction() public override returns (string memory) {
        return "Depositing funds";
    }
}
