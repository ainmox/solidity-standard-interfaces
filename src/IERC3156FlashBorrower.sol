pragma solidity >=0.5.0;

/// @title Interface for the ERC-3156 flash loan borrower
/// @custom:coauthor Alberto Cuesta Cañada (https://github.com/albertocuestacanada)
/// @custom:coauthor Fiona Kobayashi (https://github.com/fifikobayashi)
/// @custom:coauthor fubuloubu (https://github.com/fubuloubu)
/// @custom:coauthor Austin Williams (https://github.com/onewayfunction)
interface IERC3156FlashBorrower {
    /// @dev Receive a flash loan
    /// @param initiator The initiator of the loan
    /// @param token The loan currency
    /// @param amount The amount of tokens lent
    /// @param fee The additional amount of tokens to repay
    /// @param data Arbitrary data structure, intended to contain user-defined parameters
    /// @return The keccak256 hash of "ERC3156FlashBorrower.onFlashLoan"
    function onFlashLoan(
        address initiator,
        address token,
        uint256 amount,
        uint256 fee,
        bytes calldata data
    ) external returns (bytes32);
}