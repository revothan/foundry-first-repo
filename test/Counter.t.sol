// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    uint256 private count;

    // Event to notify when the count has changed
    event CountChanged(uint256 newCount);

    // Function to get the current count
    function getCount() public view returns (uint256) {
        return count;
    }

    // Function to increment the count
    function increment() public {
        count += 1;
        emit CountChanged(count);
    }

    // Function to decrement the count
    function decrement() public {
        require(count > 0, "Counter: cannot decrement below zero");
        count -= 1;
        emit CountChanged(count);
    }
}
