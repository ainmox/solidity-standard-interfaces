pragma solidity >=0.5.0;

/// @title The interface for the ERC-165 interface query standard
/// @custom:coauthor Christian Reitwießner (chris@ethereum.org)
/// @custom:coauthor Nick Johnson (nick@ethereum.org)
/// @custom:coauthor Fabian Vogelsteller (fabian@lukso.network)
/// @custom:coauthor Jordi Baylina (jordi@baylina.cat)
/// @custom:coauthor Konrad Feldmeier (konrad.feldmeier@brainbot.com)
/// @custom:coauthor William Entriken (github.com@phor.net)
/// @custom:see https://eips.ethereum.org/EIPS/eip-165
interface IERC165 {
    /// @notice Query if a contract supports an interface
    /// @param interfaceId The interface identifier, as specified in ERC-165
    /// @dev This function uses less than 30,000 gas
    /// @return `true` if the contract implements `interfaceId` and the `interfaceId` is not 0xffffffff,
    ///         `false` otherwise
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}