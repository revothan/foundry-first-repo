// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "../script/HelperConfig.s.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe) {
        HelperConfig helperConfig = new HelperConfig(); // we do not want to spend gas on real chain
        address ethUSDPriceFeed = helperConfig.activeNetworkConfig();

        // real transaction (after broadcast)
        vm.startBroadcast();
        FundMe fundMe = new FundMe(ethUSDPriceFeed);
        vm.stopBroadcast();
        return fundMe;
    }
}
