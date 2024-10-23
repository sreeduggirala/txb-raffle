// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Raffler} from "../src/Raffler.sol";

contract RafflerTest is Test {
    Raffler public raffler;

    function setUp() public {
        raffler = new Raffler();
    }
}
