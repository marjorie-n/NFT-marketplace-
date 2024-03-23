// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyNFT is ERC721Enumerable, Ownable {
    uint64 public price = 0.001 ether;
    uint256 public max_token_nft = 100;
    uint8 public presaleListMax = 2;
    address public claimFundAdress;
    string public nftURI;
    mapping(address => bool) public presaleList;
    mapping(address => uint8) public presaleListClaim;

    constructor(
        string memory _nftURI,
        address _claimFundAdress
    ) ERC721("MyNFT", "NFT") {
        nftURI = _nftURI;
        claimFundAdress = _claimFundAdress;
    }

    function setPrice(uint64 _newPrice) external onlyOwner {
        price = _newPrice;
    }

    function setTotalSales(uint256 _newTotalSales) external onlyOwner {
        max_token_nft = _newTotalSales;
    }
    function setPrelistSales (uint8 _newPrelistSales) external onlyOwner {
        presaleListMax = _newPrelistSales;
    }
}
