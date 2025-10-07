# New-Block-Number-Alert-trap
Trigger whenever the block number is a multiple of 100 (or any chosen interval).


Block Milestone Trap

A simple Drosera PoC trap that fires whenever the current block number on the Hoodi testnet hits a chosen milestone interval (e.g., every 100 blocks).
This trap is intentionally minimal, making it perfect for learning and testing Drosera’s Trap → Operator → Responder workflow.

Overview

Trap: BlockMilestoneTrap.sol

Watches the blockchain and triggers when block.number % INTERVAL == 0.

Responder: BlockMilestoneResponder.sol

Stores the last milestone block and emits an event whenever the trap fires.
