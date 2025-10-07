// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Minimal ITrap interface
interface ITrap {
    function collect() external view returns (bytes memory);
    function shouldRespond(bytes[] calldata data) external view returns (bool, bytes memory);
}

contract BlockMilestoneTrap is ITrap {
    uint256 public constant INTERVAL = 100; // trigger every 100 blocks

    function collect() external view override returns (bytes memory) {
        return abi.encode(block.number);
    }

    function shouldRespond(bytes[] calldata data)
        external
        pure
        override
        returns (bool, bytes memory)
    {
        if (data.length == 0) return (false, "");
        uint256 currentBlock = abi.decode(data[0], (uint256));

        if (currentBlock % INTERVAL == 0) {
            // fire whenever blockNumber is a multiple of 100
            return (true, abi.encode(currentBlock));
        }
        return (false, "");
    }
}
