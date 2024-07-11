// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./User.sol";

contract Borrower is User {
    uint public totalBorrowed;
    uint public collateral;
    constructor(string memory _username, address _userAddress) 
        User(_username, _userAddress) {}

    function borrowFunds(uint amount, uint collateralAmount) public {
        totalBorrowed += amount;
        collateral += collateralAmount;
    }
    function performAction() public override returns (string memory) {
        return "Borrowing funds";
    }
}
