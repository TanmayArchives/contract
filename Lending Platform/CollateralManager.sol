// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CollateralManager {
    mapping(address => uint) public collateralBalances;

    function depositCollateral(address borrower, uint amount) public {
        collateralBalances[borrower] += amount;
    }
    function withdrawCollateral(address borrower, uint amount) public {
        require(collateralBalances[borrower] >= amount, "Insufficient collateral balance");
        collateralBalances[borrower] -= amount;
    }
    function getCollateralBalance(address borrower) public view returns (uint) {
        return collateralBalances[borrower];
    }
}
