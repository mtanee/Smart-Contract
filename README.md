# Smart-Contract
# Event Ticketing Smart Contract

This Solidity smart contract is designed to facilitate event management and ticket sales within an organization on the Ethereum blockchain. The contract allows organizers to create events, users to purchase tickets, and users to transfer tickets to others.

## Smart Contract Overview

### Event Struct
- The `Event` struct defines the structure of an event, including its name, organizer's address, ticket price (amount), event date, total ticket count, and remaining ticket count.

### State Variables
- `mapping (uint => Event) public events`: Associates an event ID with an `Event` struct, used to store event details.
- `mapping (address => mapping (uint => uint)) public ticket`: Associates Ethereum addresses with a mapping of event IDs to ticket quantities, used to track ticket ownership.
- `uint public nextId`: Generates unique event IDs.

### Functions

#### `create_Event`
- Allows an organizer to create a new event by specifying its name, ticket price, date, and total ticket count.
- Checks include event date in the future, positive ticket count and amount.
- Creates and stores a new `Event` struct in the `events` mapping with a unique event ID.

#### `buy_ticket`
- Allows users to buy tickets for a specific event by providing the event ID and the quantity of tickets to purchase.
- Checks include event existence, future event date, available tickets, and correct payment.
- Deducts purchased tickets from the event's remaining ticket count and updates the user's ticket ownership in the `ticket` mapping.

#### `transfer_Ticket`
- Allows users to transfer tickets to another address by specifying the recipient's address, the quantity of tickets to transfer, and the event ID.
- Checks include event existence, future event date, and sender's ticket ownership.
- Transfers the specified quantity of tickets from the sender's address to the recipient's address.

## Getting Started

1. Deploy the smart contract on the Ethereum blockchain.
2. Interact with the contract using a compatible Ethereum wallet or through a decentralized application (DApp).
3. Organizers can create events, users can purchase tickets, and users can transfer tickets to others.

## Considerations

- This contract provides basic event management and ticketing functionality. You may want to add more features like event cancellation, refunds, or administrative roles for organizers.
- Ensure that the contract is secure and follows best practices before deploying it on the blockchain.
- Conduct thorough testing to verify the contract's functionality and security.
- Keep the contract's state variables and functions in mind when designing a user interface or integrating it into a DApp.

## License

This smart contract is released under the MIT License. See the SPDX-License-Identifier at the top of the contract file for details.
