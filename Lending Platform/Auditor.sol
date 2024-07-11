// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./User.sol";

contract Auditor is User {
    constructor(string memory _username, address _userAddress) 
        User(_username, _userAddress) {}

    // abstract function
    function performAction() public override returns (string memory) {
        return "Auditing transactions";
    }

    function audit(address userAddress, string memory action) public view returns (string memory) {
        // to verify and validate the actions performed by a user. will do later
        return string(abi.encodePacked("Auditing action: ", action, " for user: ", userAddress));
    }
}

