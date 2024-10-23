// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Raffler {
    // Structure for storing all raffle information
    struct Raffle {
        uint8 x;
        // Add more fields here
    }

    // Data structure/type to store all raffles
    // Change variable visibility if needed

    // Constructor to initialize Ownable() and VRF-related variables
    constructor() {}

    // Function to enter the raffle, adds participant to the raffle (by address)
    // Change function visibility, args, and return value if needed
    function enter() public {}

    // Function to request random number from VRF
    // Change function visibility, args, and return value if needed
    function requestRandomNumber() public {}

    // Callback function for VRF to fulfill randomness and determine winner
    // Change function visibility, args, and return value if needed
    function fulfillRandomness() public {}

    // Function to withdraw funds from the contract (for winner)
    // Change function visibility, args, and return value if needed
    function withdraw() public {}
}
