// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract SimpleStorage {

    uint256 public favouriteNumber; 

    // store a number
    function store(uint256 _favouriteNumber) public {
        favouriteNumber = _favouriteNumber;
    }

    // retrieve the number
    function retrieve() public view returns (uint256) {
        return favouriteNumber;
    }
}
