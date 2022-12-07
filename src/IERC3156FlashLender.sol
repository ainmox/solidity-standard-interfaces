pragma solidity >=0.5.0;

/// @title Interface for the ERC-3156 flash loan lender
/// @custom:coauthor Alberto Cuesta Cañada (https://github.com/albertocuestacanada)
/// @custom:coauthor Fiona Kobayashi (https://github.com/fifikobayashi)
/// @custom:coauthor fubuloubu (https://github.com/fubuloubu)
/// @custom:coauthor Austin Williams (https://github.com/onewayfunction)
interface IERC3156FlashLender {
    /// @dev The amount of currency available to be lent
    /// @param token The loan currency
    /// @return maxTokens The maximum amount of `token` that can be borrowed
    function maxFlashLoan(address token) external view returns (uint256 maxTokens);

    /// @dev The fee to be charged for a given loan
    /// @param token The loan currency
    /// @param amount The amount of tokens lent
    /// @return fee The amount of `token` to be charged for the loan, on top of the returned principal
    function flashFee(
        address token,
        uint256 amount
    ) external view returns (uint256 fee);

    /// @dev Initiate a flash loan
    /// @param receiver The receiver of the tokens in the loan, and the receiver of the callback
    /// @param token The loan currency
    /// @param amount The amount of tokens lent
    /// @param data Arbitrary data structure, intended to contain user-defined parameters
    /// @return Always `true` unless throwing
    function flashLoan(
        IERC3156FlashBorrower receiver,
        address token,
        uint256 amount,
        bytes calldata data
    ) external returns (bool success);
}
