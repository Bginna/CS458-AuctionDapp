//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract AuctionHouse{
    Auction[] public auctionList;

    function createAuction (string memory auctionTitle, uint startPrice, string memory auctionDescription) public {
        require (startPrice > 0, 'Start price must be greater than zero.');

        Auction newAuction = new Auction(payable(msg.sender), auctionTitle, startPrice, auctionDescription);

        auctionList.push(newAuction);
    }
}


contract Auction {

    address payable private auctionOwner;
    string auctionTitle;
    uint startPrice;
    string auctionDescription;

    constructor (address payable _auctionOwner, string memory _auctionTitle, uint _startPrice, string memory _auctionDescription) {
        auctionOwner = _auctionOwner;
        auctionTitle = _auctionTitle;
        startPrice = _startPrice;
        auctionDescription = _auctionDescription;
    }

    address payable public highestBidder;
    uint256 public highestBid = 0;

    function bid(uint256 bidAmount) public payable {
        require(bidAmount > highestBid, "There already is a higher bid.");
        require(highestBidder != msg.sender, "You already are the highest bidder.");
        
        if (highestBid != 0) {
            // send the previously highest bid back to the previous bidder
            payable(highestBidder).transfer(highestBid);
        }
        
        highestBidder = payable(msg.sender);
        highestBid = bidAmount;
    }

    function contractAddress() public view returns (address){
        return address(this);
    }

}