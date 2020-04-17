pragma solidity ^0.6.0;

import "./IERC721.sol";

/**
 * @title ERC-721 Non-Fungible Token Standard, optional enumeration extension
 * @dev See https://eips.ethereum.org/EIPS/eip-721
 */
abstract contract IERC721Enumerable is IERC721 {
    function totalSupply() external virtual view returns (uint256);
    function tokenOfOwnerByIndex(address owner, uint256 index) external virtual view returns (uint256 tokenId);

    function tokenByIndex(uint256 index) external virtual view returns (uint256);
}