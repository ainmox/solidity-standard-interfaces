pragma solidity >=0.5.0;

/// @title The interface for ERC-173 contract ownership standard
/// @custom:coauthor Nick Mudge (https://github.com/mudgen)
/// @custom:coauthor Dan Finlay (dan@danfinlay.com)
/// @custom:coauthor ainmox (https://github.com/ainmox)
/// @custom:see https://eips.ethereum.org/EIPS/eip-173
interface IERC173 {
    /// @notice Emitted when ownership of a contract changes
    /// @param previousOwner The address of the previous owner
    /// @param newOwner The address of the new owner
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /// @notice Gets the address of the owner
    /// @return The address of the owner
    function owner() view external returns (address);

    /// @notice Set the address of the new owner of the contract
    /// @dev Set `newOwner` to address(0) to renounce any ownership.
    /// @param newOwner The address of the new owner of the contract
    function transferOwnership(address newOwner) external;
}