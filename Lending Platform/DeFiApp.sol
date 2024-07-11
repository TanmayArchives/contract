// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./LendingPlatform.sol";
import "./CollateralManager.sol";

contract DeFiApp {
    LendingPlatform public lendingPlatform;
    CollateralManager public collateralManager;

    constructor() {
        lendingPlatform = new LendingPlatform();
        collateralManager = new CollateralManager();
    }
    function registerLender(string memory username) public {
        lendingPlatform.registerLender(username);
    }
    function registerBorrower(string memory username) public {
        lendingPlatform.registerBorrower(username);
    }
    function registerAuditor(string memory username) public {
        lendingPlatform.registerAuditor(username);
    }
    function lenderDeposit(uint amount) public {
        lendingPlatform.lenderDeposit(amount);
    }
    function borrowerBorrow(uint amount, uint collateralAmount) public {
        collateralManager.depositCollateral(msg.sender, collateralAmount);
        lendingPlatform.borrowerBorrow(amount, collateralAmount);
    }
    function auditorAudit(address userAddress) public view returns (string memory) {
        return lendingPlatform.auditorAudit(userAddress);
    }

    function calculateInterest(uint principal, uint timeInYears) public view returns (uint) {
        return lendingPlatform.calculateInterest(principal, timeInYears);
    }
    function getCollateralBalance(address borrower) public view returns (uint) {
        return collateralManager.getCollateralBalance(borrower);
    }
}
