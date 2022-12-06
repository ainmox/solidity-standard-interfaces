pragma solidity >=0.5.0;

/// @title The interface for the ERC-165 interface query standard
/// @custom:coauthor ainmox (https://github.com/ainmox)
interface IERC165 {
    /// @notice Query if a contract supports an interface
    /// @param interfaceId The interface identifier, as specified in ERC-165
    /// @dev This function uses less than 30,000 gas
    /// @return `true` if the contract implements `interfaceId` and the `interfaceId` is not 0xffffffff,
    ///         `false` otherwise
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}