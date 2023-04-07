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
                <img
                  v-show="isBid"
                  id="isBid"                  >
            </b-input-group>
          </form>
    </div>
  </template>

<script>



export default {
  methods: {
    handleSubmit(bidAmount) {
      console.log(bidAmount);
    }
  }
}
</script>