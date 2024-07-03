// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../../src/FundMe.sol";
import {DeployFundMe} from "../../script/DeployFundMe.s.sol";
import {FundFundMe, WithDrawFundMe} from "../../script/Interactions.s.sol";

contract Interactions is Test {
    FundMe fundMe;
    address USER = makeAddr("user");
    address USER_2 = makeAddr("user2"); // Changed to "user2"
    uint256 constant SEND_VALUE = 1 ether;
    uint256 constant STARTING_BALANCE = 10 ether;
    uint256 constant insufficientAmount = 1e15;
    uint256 constant gasPrice = 1;

    function setUp() external {
        DeployFundMe deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();
        vm.deal(USER, STARTING_BALANCE);
    }

    function testUserCanFundInteractions() public {
        FundFundMe fund = new FundFundMe();
        fund.fund(address(fundMe));
        WithDrawFundMe withDrawFundMe = new WithDrawFundMe();
        withDrawFundMe.withdraw(address(fundMe));

        assert(address(fundMe).balance == 0);
    }
}
