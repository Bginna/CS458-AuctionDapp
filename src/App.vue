<template>
  <div class="auction-app">
    <h1>Ethereum Auction Dapp</h1>
    <p>Current highest bid: {{ highestBid }} ETH</p>
    <p>Current highest bidder: {{ highestBidder }}</p>
    <form @submit.prevent="placeBid">
      <!-- might need to: "npm install bootstrap-vue" -->
      <b-input-group class="input-group">
        <input class="form-control" v-model="bidAmount" placeholder="Enter Bid Amount" />
        <button class="btn btn-primary" type="submit">Place Bid</button>
      </b-input-group>
    </form>
    
    <form @submit.prevent="createAuction">
      <button class="btn btn-primary" type="submit">Create a New Auction</button>
    </form>
  </div>
</template>

<script>
import 'bootstrap/dist/css/bootstrap.css'
import '@/assets/style.css';
import web3 from '@/web3';
import AuctionContract from "../contracts/artifacts/Auction.json" //json file compiled from remix
const contractAddress = '0x007e06D85F588A94b77f1eCB5003543C32cCA335'; //replace with your contract address

export default {
  //declare and initialize data
  data() {
    return {
      bidAmount: "",
      highestBid: 0,
    };
  },
  //initialize data from blockchain and watch for changes in blockchain data (i.e. highest bid)
  async created() {
    this.auction = new web3.eth.Contract(AuctionContract.abi, contractAddress); //https://web3js.readthedocs.io/en/v1.2.0/web3-eth-contract.html
    console.log(AuctionContract.abi);
    this.highestBid = await this.auction.methods.highestBid().call();
    //console.log(this.highestBid);
    //this.highestBid = web3.utils.fromWei(this.highestBid, "ether");
    //this.highestBidder = await this.auction.methods.highestBidder().call();
  },
  methods: {
    //place bid function that will be called when user clicks "Place Bid" button
    async placeBid() {
      console.log('Placing bid...');
      const accounts = await window.ethereum.request({ method: 'eth_requestAccounts' }); //https://ethereum.stackexchange.com/questions/117498/window-ethereum-request-method-eth-requestaccounts-does-not-open
      console.log(accounts);
      const bidAmountInWei = web3.utils.toWei(this.bidAmount, "ether");
      console.log(`Bid amount in Wei: ${bidAmountInWei}`);

      await this.auction.methods.bid(bidAmountInWei).send({ //https://web3js.readthedocs.io/en/v1.2.0/web3-eth-contract.html#methods-mymethod-send
        from: accounts[0],
        value: bidAmountInWei,
      });

      this.highestBid = await this.auction.methods.highestBid().call(); //https://web3js.readthedocs.io/en/v1.2.0/web3-eth-contract.html#methods-mymethod-call
      this.highestBid = web3.utils.fromWei(this.highestBid, "ether");
      console.log(`Highest bid: ${this.highestBid}`);
    },
    async createAuction() {
      console.log('Creating a new auction...');
      
    }
  },
};
</script>