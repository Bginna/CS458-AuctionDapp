<template>
    <div class="auction-app">
      <h1>Ethereum Auction Dapp</h1>
      <p>Current highest bid: {{ highestBid }}</p>
      <form @submit.prevent="handleSubmit(bidAmount)">
            <b-input-group>
              <input
                v-model="bidAmount" placeholder= "Enter Bid Amount"
              />
                <button>Place Bid</button>
            </b-input-group>
          </form>
    </div>
  </template>

<script>
// import {Auction} from "../contracts/Auction.sol"

export default {
  methods: {
    handleSubmit(bidAmount) {
      console.log(bidAmount);
//      Auction.bid(bidAmount);
    }
  }
}
</script>