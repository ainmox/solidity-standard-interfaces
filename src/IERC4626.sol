pragma solidity >=0.5.0;

import {IERC20} from "./IERC20.sol";

/// @title The interface for the ERC-4626 tokenized vault standard
/// @custom:coauthor Joey Santoro (https://github.com/joeysantoro)
/// @custom:coauthor t11s (https://github.com/transmissions11)
/// @custom:coauthor Jet Jadeja (https://github.com/JetJadeja)
/// @custom:coauthor Alberto Cuesta Cañada (https://github.com/alcueca)
/// @custom:coauthor Señor Doggo (https://github.com/fubuloubu)
/// @custom:see https://eips.ethereum.org/EIPS/eip-4626
interface IERC4626 is IERC20 {
    /// @notice Emitted when `sender` has exchanged `assets` for `shares` and transferred those `shares` to `owner`
    /// @param sender The address of the sender
    /// @param owner The address of the owner
    /// @param assets The amount of assets exchanged for shares
    /// @param shares The amount of shares transferred to `owner`
    event Deposit(address indexed sender, address indexed owner, uint256 assets, uint256 shares);

    /// @notice Emitted when `sender` has exchanged `shares` owner by `owner` for `assets` and transferred those `assets` to `receiver`
    /// @param sender The address of the sender
    /// @param receiver The address of the receiver
    /// @param owner The address of the owner
    /// @param assets The amount of assets transferred to `receiver`
    /// @param shares The amount of shares exchanged for assets
    event Withdraw(address indexed sender, address indexed receiver, address indexed owner, uint256 assets, uint256 shares);

    /// @notice The address of the underlying token used for the Vault for accounting, depositing, and withdrawing
    /// @return The asset
    function asset() external view returns (IERC20);

    /// @notice The total amount of the underlying asset that is "managed" by the Vault
    /// @return The total assets
    function totalAssets() external view returns (uint256);

    /// @notice The amount of shares that the Vault would exchange for the amount of assets provided, in an
    ///         ideal scenario where all the conditions are met
    /// @param assets The amount of assets to exchange for shares
    /// @return shares The amount of shares that would be received
    function convertToShares(uint256 assets) external view returns (uint256 shares);

    /// @notice The amount of assets that the Vault would exchange for the amount of shares provided, in an
    ///         ideal scenario where all the conditions are met
    /// @param shares The amount of shares to exchange for assets
    /// @return assets The amount of assets that would be received
    function convertToAssets(uint256 shares) external view returns (uint256 assets);

    /// @notice The maximum amount of the underlying asset that cna be deposited into the Vault for the `receiver`,
    ///         through a `deposit` call
    /// @param receiver The address of the receiver
    /// @return maxAssets The maximum amount of assets that can be deposited
    function maxDeposit(address receiver) external view returns (uint256 maxAssets);

    /// @notice Allows an on-chain or off-chain user to simulate the effects of their deposit at the current block,
    ///         given current on-chain conditions
    /// @param assets The amount of assets to deposit
    /// @return shares The amount of shares that would be received
    function previewDeposit(uint256 assets) external view returns (uint256 shares);

    /// @notice Mints `shares` Vault shares to `receiver` by depositing exactly `assets` of underlying tokens
    /// @param assets The amount of assets to deposit
    /// @param receiver The address of the receiver
    /// @return shares The amount of shares minted
    function deposit(uint256 assets, address receiver) external returns (uint256 shares);

    /// @notice Maximum amount of shares that can be minted from the Vault for the `receiver`, through a `mint` call
    /// @param receiver The address of the receiver
    /// @return maxShares The maximum amount of shares that can be minted
    function maxMint(address receiver) external view returns (uint256 maxShares);

    /// @notice Allows an on-chain or off-chain user to simulate the effects of their mint at the current block,
    ///         given current on-chain conditions
    /// @param shares The amount of shares to mint
    /// @return assets The amount of assets that would be exchanged
    function previewMint(uint256 shares) external view returns (uint256 assets);

    /// @notice Mints exactly `shares` Vault shares to `receiver` by depositing `assets` of underlying tokens
    /// @param shares The amount of shares to mint
    /// @param receiver The address of the receiver
    /// @return assets The amount of assets exchanged
    function mint(uint256 shares, address receiver) external returns (uint256 assets);

    /// @notice Maximum amount of the underlying asset that can be withdrawn from the `owner` balance in the Vault,
    ///         through a `withdraw` call
    /// @param owner The address of the owner
    /// @return maxAssets The maximum amount of assets that can be withdrawn
    function maxWithdraw(address owner) external view returns (uint256 maxAssets);

    /// @notice Allows an on-chain or off-chain user to simulate the effects of their withdraw at the current block,
    ///         given current on-chain conditions
    /// @param assets The amount of assets to withdraw
    /// @return shares The amount of shares that would be received
    function previewWithdraw(uint256 assets) external view returns (uint256 shares);

    /// @notice Burns `shares` Vault shares from `owner` and sends exactly `assets` of underlying tokens to `receiver`
    /// @param assets The amount of assets to withdraw
    /// @param receiver The address of the receiver
    /// @param owner The address of the owner
    /// @return shares The amount of shares burned
    function withdraw(uint256 assets, address receiver, address owner) external returns (uint256 shares);

    /// @notice Maximum amount of Vault shares that can be burned from the `owner` balance in the Vault,
    ///         through a `redeem` call
    /// @param owner The address of the owner
    /// @return maxShares The maximum amount of shares that can be redeemed
    function maxRedeem(address owner) external view returns (uint256 maxShares);

    /// @notice Allows an on-chain or off-chain user to simulate the effects of their redemption at the current block,
    ///         given current on-chain conditions
    /// @param shares The amount of shares to redeem
    /// @return assets The amount of assets that would be received
    function previewRedeem(uint256 shares) external view returns (uint256 assets);

    /// @notice Burns exactly `shares` Vault shares from `owner` and sends `assets` of underlying tokens to `receiver`
    /// @param shares The amount of shares to redeem
    /// @param receiver The address of the receiver
    /// @param owner The address of the owner
    /// @return assets The amount of assets received
    function redeem(uint256 shares, address receiver, address owner) external returns (uint256 assets);
}