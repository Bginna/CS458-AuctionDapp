//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Auction {
    address public highestBidder = 0;
    uint256 public highestBid = 0;

    function bid(uint256 bidAmount) public payable {
        require(bidAmount > highestBid, "There already is a higher bid.");
        require(highestBidder != msg.sender, "You already are the highest bidder.");
        
        if (highestBid != 0) {
            // send the previously highest bid back to the previous bidder
            payable(highestBidder).transfer(highestBid);
        }
        
        highestBidder = msg.sender;
        highestBid = bidAmount;
    }

    function contractAddress() public view returns (address){
        address contractAddress = address(this);
        return contractAddress;
    }
}