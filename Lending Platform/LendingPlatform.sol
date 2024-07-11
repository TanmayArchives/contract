// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Lender.sol";
import "./Borrower.sol";
import "./Auditor.sol";

contract LendingPlatform {
    mapping(address => Lender) public lenders;
    mapping(address => Borrower) public borrowers;
    mapping(address => Auditor) public auditors;

    // Interest rate (per annum)
    uint constant interestRate = 5;

    function registerLender(string memory _username) public {
        Lender newLender = new Lender(_username, msg.sender);
        lenders[msg.sender] = newLender;
    }

    function registerBorrower(string memory _username) public {
        Borrower newBorrower = new Borrower(_username, msg.sender);
        borrowers[msg.sender] = newBorrower;
    }

    function registerAuditor(string memory _username) public {
        Auditor newAuditor = new Auditor(_username, msg.sender);
        auditors[msg.sender] = newAuditor;
    }

    function lenderDeposit(uint amount) public {
        require(address(lenders[msg.sender]) != address(0), "Not a registered lender");
        lenders[msg.sender].depositFunds(amount);
    }

    function borrowerBorrow(uint amount, uint collateralAmount) public {
        require(address(borrowers[msg.sender]) != address(0), "Not a registered borrower");
        borrowers[msg.sender].borrowFunds(amount, collateralAmount);
    }

    function auditorAudit(address userAddress) public view returns (string memory) {
        require(address(auditors[msg.sender]) != address(0), "Not a registered auditor");
        User user = User(userAddress);
        return auditors[msg.sender].audit(userAddress, user.performAction());
    }

    function calculateInterest(uint principal, uint timeInYears) public pure returns (uint) {
        return (principal * interestRate * timeInYears) / 100;
    }
}
