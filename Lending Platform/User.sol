// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

abstract contract User {
    string public username;
    address public userAddress;
    constructor(string memory _username, address _userAddress) {
        username = _username;
        userAddress = _userAddress;
    }
    // Abstract function
    function performAction() public virtual returns (string memory);
}
