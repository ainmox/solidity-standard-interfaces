pragma solidity >=0.5.0;

/// @title The interface for ERC-1363 payable token standard spender
/// @custom:coauthor Vittorio Minacori (https://github.com/vittominacori)
/// @custom:see https://eips.ethereum.org/EIPS/eip-1363
interface IERC1363Spender {
    /// @notice Handler the approval of ERC-1363 tokens
    /// @param owner The address which called `approveAndCall` function
    /// @param value The amount of tokens being spent
    /// @param data Additional data with no specified format
    /// @return signature bytes4(keccak256("onApprovalReceived(address,uint256,bytes)")) unless throwing
    function onApprovalReceived(
        address owner,
        uint256 value,
        bytes calldata data
    ) external returns (bytes4 signature);
}