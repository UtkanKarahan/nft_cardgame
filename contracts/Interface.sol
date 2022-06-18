// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

interface ICard {
    function mintCard(address player,string calldata tokenURI) external payable returns (uint256);
    function safeTransferFrom(address from,address to,uint tokenId) external;
    function transferFrom(address from, address to,uint amount) external;
    function getPrice(uint _tokenPrice) external view returns(uint);
    }

contract Interaction {
    address cardAddr;
    address currencyAddr;

    function setCardAddr(address _card) public payable {
       cardAddr = _card;
    }

    function setCurrencyAddr(address _currency) public payable {
       currencyAddr = _currency;
    }

    function transferCard(address _to, uint _tokenId) public payable {
        uint price = ICard(cardAddr).getPrice(_tokenId);
        ICard(currencyAddr).transferFrom(_to, msg.sender, price);
        ICard(cardAddr).safeTransferFrom(msg.sender, _to, _tokenId);
    }
}