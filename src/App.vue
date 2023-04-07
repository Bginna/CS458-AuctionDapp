<template>
    <div class="auction-app">
      <h1>Ethereum Auction Dapp</h1>
      <p>Current highest bid: {{ highestBid }}</p>
      <input v-model="bidAmount" placeholder="Enter bid amount" />
      <button @click="placeBid">Place Bid</button>
    </div>
  </template>