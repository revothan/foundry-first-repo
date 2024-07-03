// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    uint256 public count;

    event CounterIncremented(uint256 newCount);
    event CounterDecremented(uint256 newCount);

    constructor() {
        count = 0;
    }

    function increment() public {
        count += 1;
        emit CounterIncremented(count);
    }

    function decrement() public {
        require(count > 0, "Counter: count cannot be negative");
        count -= 1;
        emit CounterDecremented(count);
    }

    function reset() public {
        count = 0;
    }
}
