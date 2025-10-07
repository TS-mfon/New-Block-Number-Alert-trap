// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BlockMilestoneResponder {
    uint256 public lastMilestoneBlock;
    event MilestoneReached(uint256 blockNumber, uint256 timestamp);

    function respondOnMilestone(uint256 blockNumber) external {
        lastMilestoneBlock = blockNumber;
        emit MilestoneReached(blockNumber, block.timestamp);
    }
}
