pragma solidity >=0.5.0;

/// @title The interface for ERC-1363 payable token standard receiver
/// @custom:coauthor Vittorio Minacori (https://github.com/vittominacori)
/// @custom:see https://eips.ethereum.org/EIPS/eip-1363
interface IERC1363Receiver {
    /// @notice Handler the receipt of ERC-1363 tokens
    /// @param operator The address which called `transferAndCall` or `transferFromAndCall` function
    /// @param source The address which previously owned the tokens
    /// @param amount The amount of tokens being transferred
    /// @param data Additional data with no specified format
    /// @return signature bytes4(keccak256("onTransferReceived(address,address,uint256,bytes)")) unless throwing
    function onTransferReceived(
        address operator,
        address source,
        uint256 amount,
        bytes calldata data
    ) external returns (bytes4 signature);
}