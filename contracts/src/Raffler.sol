// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Raffler {
    // Structure for storing all raffle information
    struct Raffle {
        address[] participants;
        uint256 ticketPrice;
        address winner;
        bool winnerWithdrew;
    }

    // Data structure/type to store all raffles
    // Change variable visibility if needed
    Raffle[] public raffles;

    // Constructor to initialize Ownable() and VRF-related variables
    constructor() {}

    // Function to create raffle
    // Change function visibility, args, and return value if needed
    function createRaffle(uint256 _ticketPrice) public {
        Raffle memory newRaffle;
        newRaffle.ticketPrice = _ticketPrice;
        raffles.push(newRaffle);
    }

    // Function to enter the raffle, adds participant to the raffle (by address)
    // Change function visibility, args, and return value if needed
    function enter(uint256 _raffleId, uint256 _numTickets) public payable {
        if (raffles[_raffleId].winner != address(0)) {
            // raffle has ended
            revert("Raffler: Raffle has ended.");
        }

        // make sure that user has sufficient amount to buy tickets
        require(
            msg.value == (raffles[_raffleId].ticketPrice) * _numTickets,
            "Raffler: Insufficient balance"
        );
        // added caller to array
        for (uint i = 0; i < _numTickets; i++) {
            raffles[_raffleId].participants.push(msg.sender);
        }
    }

    // Function to request random number from VRF
    // Change function visibility, args, and return value if needed
    function requestRandomNumber() public {}

    // Callback function for VRF to fulfill randomness and determine winner
    // Change function visibility, args, and return value if needed
    function fulfillRandomness() public {}

    // Function to withdraw funds from the contract (for winner)
    // Change function visibility, args, and return value if needed
    function withdraw(uint256 _raffleId) public {
        // winner should only call this once
        if (raffles[_raffleId].winnerWithdrew) {
            revert("Raffle: Winner has already withdrawn.");
        }

        if (msg.sender == raffles[_raffleId].winner) {
            // calculate total bounty
            uint256 bounty = raffles[_raffleId].ticketPrice *
                (raffles[_raffleId].participants.length);

            // make the withdrawl bool true
            raffles[_raffleId].winnerWithdrew = true;

            // transfer bounty to winner
            payable(msg.sender).transfer(bounty);
        }
    }
}
