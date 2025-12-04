// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Task2 {
    uint256 public number;
    bool public isActive;
    string private message = "Hello GDG AASTU!";

    function setNumber(uint256 _num) public {
        number = _num;
    }

    function toggleActive() public {
        isActive = !isActive;
    }

    function add(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }

    function getMessage() public view returns (string memory) {
        return message;
    }

    function isNumberBig() public view returns (bool) {
        return number > 10;
    }
}
