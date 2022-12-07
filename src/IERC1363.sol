pragma solidity >=0.5.0;

import {IERC20} from "./IERC20.sol";
import {IERC165} from "./IERC165.sol";

/// @title The interface for ERC-1363 payable token standard
/// @custom:coauthor Vittorio Minacori (https://github.com/vittominacori)
/// @custom:see https://eips.ethereum.org/EIPS/eip-1363
interface IERC1363 is IERC20, IERC165 {
    /// @notice Transfers tokens from `msg.sender` to `recipient` and then call `IERC1363Receiver.onTransferReceived`
    ///         on `recipient`
    /// @param recipient The address of the recipient
    /// @param amount The amount of tokens to transfer
    /// @param data Additional data with no specified format, sent in call to `recipient`
    /// @return success true if transfer and call succeeded, false otherwise
    function transferAndCall(address recipient, uint256 amount, bytes calldata data) external returns (bool success);

    /// @notice Transfers tokens from `msg.sender` to `recipient` and then call `IERC1363Receiver.onTransferReceived`
    ///         on `recipient`with no data
    /// @param recipient The address of the recipient
    /// @param amount The amount of tokens to transfer
    /// @return success true if transfer and call succeeded, false otherwise
    function transferAndCall(address recipient, uint256 amount) external returns (bool success);

    /// @notice Transfers tokens from `owner` to `recipient` and then call `IERC1363Receiver.onTransferReceived`
    ///         on `recipient`
    /// @param owner The address of the owner
    /// @param recipient The address of the recipient
    /// @param amount The amount of tokens to transfer
    /// @param data Additional data with no specified format, sent in call to `recipient`
    /// @return success true if transfer and call succeeded, false otherwise
    function transferFromAndCall(
        address owner,
        address recipient,
        uint256 amount,
        bytes calldata data
    ) external returns (bool success);

    /// @notice Transfers tokens from `owner` to `recipient` and then call `IERC1363Receiver.onTransferReceived`
    ///         on `recipient` with no data
    /// @param owner The address of the owner
    /// @param recipient The address of the recipient
    /// @param amount The amount of tokens to transfer
    /// @return success true if transfer and call succeeded, false otherwise
    function transferFromAndCall(
        address owner,
        address recipient,
        uint256 amount
    ) external returns (bool success);

    /// @notice Approves `spender` to transfer `amount` tokens on `msg.sender`'s behalf and then call
    ///         `IERC1363Spender.onApprovalReceived` on `spender`
    /// @param spender The address of the spender
    /// @param value The amount of tokens to approve
    /// @param data Additional data with no specified format, sent in call to `spender`
    /// @return success true if approve and call succeeded, false otherwise
    function approveAndCall(address spender, uint256 value, bytes calldata data) external returns (bool success);

    /// @notice Approves `spender` to transfer `amount` tokens on `msg.sender`'s behalf and then call
    ///         `IERC1363Spender.onApprovalReceived` on `spender` with no data
    /// @param spender The address of the spender
    /// @param value The amount of tokens to approve
    /// @return success true if approve and call succeeded, false otherwise
    function approveAndCall(address spender, uint256 value) external returns (bool success);
}