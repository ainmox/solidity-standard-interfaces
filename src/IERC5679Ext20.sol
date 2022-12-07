pragma solidity >=0.5.0;

import {IERC20} from "./IERC20.sol";

/// @title The interface for extending an ERC-20 with the ERC-5679 token minting and burning standard
/// @custom:coauthor Zainan Victor Zhou (https://github.com/xinbenlv)
/// @custom:see https://eips.ethereum.org/EIPS/eip-5679
interface IERC5679Ext20 is IERC20 {
    /// @notice Mints `amount` tokens to `recipient`
    /// @param recipient The address of the recipient
    /// @param amount The amount of tokens to mint
    /// @param data Arbitrary data with no specified format associated with the call
    function mint(address recipient, uint256 amount, bytes calldata data) external;

    /// @notice Burns `amount` tokens from `owner`
    /// @param owner The address of the owner
    /// @param amount The amount of tokens to burn
    /// @param data Arbitrary data with no specified format associated with the call
    function burn(address owner, uint256 amount, bytes calldata data) external;
}