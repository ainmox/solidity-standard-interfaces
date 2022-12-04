pragma solidity >=0.5.0;

/// @title The interface for an ERC20 token
/// @custom:coauthor ainmox (ainmox.eth)
/// @custom:see https://eips.ethereum.org/EIPS/eip-20
interface IERC20 {
    /// @notice Emitted when `owner` approves `spender` to spend `amount` tokens on their behalf
    /// @param owner The address of the owner
    /// @param spender The address of the spender
    /// @param value The number of tokens `owner` approved `spender` to spend
    event Approve(address indexed owner, address indexed spender, uint256 value);

    /// @notice Emitted when `owner` transfers `amount` tokens to `recipient`
    /// @param owner The address of the owner
    /// @param recipient The address of the recipient
    /// @param amount The number of tokens `owner` transferred to `recipient`
    event Transfer(address indexed owner, address indexed recipient, uint256 amount);

    /// @notice The number of tokens in circulation
    /// @return The total supply
    function totalSupply() external view returns (uint256);

    /// @notice Gets the balance of `owner`
    /// @param owner The address of the owner
    /// @return balance The balance
    function balanceOf(address owner) external view returns (uint256 balance);

    /// @notice Approves `spender` to spend `amount` tokens on behalf of `owner`
    /// @param spender The address of the spender
    /// @param value The amount of tokens to approve `spender` to spend
    /// @return success `true` if the approval succeeded otherwise `false`
    function approve(address spender, uint256 value) external returns (bool success);

    /// @notice The number of tokens that `owner` has approved `spender` to spend on their behalf
    /// @param owner The address of the owner
    /// @param spender The address of the spender
    /// @return The number of tokens that `spender` is allowed to spend on behalf of `owner`
    function allowance(address owner, address spender) external view returns (uint256);

    /// @notice Transfers `amount` tokens to `recipient`
    /// @param amount The number of tokens to transfer
    /// @return success `true` if the approval succeeded otherwise `false`
    function transfer(address recipient, uint256 amount) external returns (bool success);

    /// @notice Transfers `amount` tokens from `owner` to `recipient`
    /// @dev `owner` must have set an approval for `msg.sender`
    /// @param owner The address of the account that owns the tokens
    /// @param recipient The address of the account that will receive the tokens
    /// @param amount The number of tokens to transfer
    /// @return success `true` if the approval succeeded otherwise `false`
    function transferFrom(address owner, address recipient, uint256 amount) external returns (bool success);
}
