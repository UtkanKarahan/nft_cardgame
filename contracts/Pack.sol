//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Pack is ERC721{
    using Counters for Counters.Counter;
    mapping(uint => bool) isOpened;


    Counters.Counter private _tokenIds;

        constructor() ERC721("Pack", "PCK") public {
    }

    function mintPack(address player, string memory tokenURI) public payable returns (uint256) {
        _tokenIds.increment();
        
        uint256 newPackId = _tokenIds.current();
        _safeMint(player, newPackId);
        return newPackId;
    }

    function openPack(uint _tokenId) public{
        isOpened[_tokenId] = true;
    }

    function checkOpened(uint _tokenId) public returns (bool){
        return isOpened[_tokenId];
    }

}