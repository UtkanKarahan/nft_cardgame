//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Card is ERC721{
    //uint256 private _tokenIds;
    uint256 public defaultPrice=10;
    mapping(uint256 => string) public tokenURIs;
    mapping(address => uint256[]) public tokenAddresses;
    mapping(uint256 => uint256) public tokenPrices;
    mapping(uint256 => bool) public isAuctioned;
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("Card", "CRD") public {
    }

    event priceChange(
        address indexed owner,
        uint tokenId,
        uint oldPrice,
        uint newPrice
    );

    function mintCard(address player, string memory tokenURI) public payable returns (uint256) {
        _tokenIds.increment();

        uint256 newCardId = _tokenIds.current();
        _safeMint(player, newCardId);
        tokenURIs[newCardId] = (tokenURI);
        tokenAddresses[player].push(newCardId);
        tokenPrices[newCardId] = defaultPrice;
        return newCardId;
    }

    function setPrice(uint _tokenId, uint amount) public{
        require(ownerOf(_tokenId) == msg.sender, "Only owner can set price!");
        uint oldPrice = tokenPrices[_tokenId];
        tokenPrices[_tokenId] = amount;
        emit priceChange(msg.sender, _tokenId, oldPrice, amount);
    }

    function getPrice(uint _tokenId) public view returns(uint){
        return tokenPrices[_tokenId];
    }

    function setAuctionStatus(uint _tokenId, bool auction) public{
        require(isAuctioned[_tokenId] != auction, "Token is already in asked status.");
        isAuctioned[_tokenId] = auction;
    }

    function getAuctionStatus(uint _tokenId) public view returns(bool){
        return isAuctioned[_tokenId];
    }
}