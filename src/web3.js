import Web3 from 'web3';

let web3;

// source: https://blog.valist.io/how-to-connect-web3-js-to-metamask-in-2020-fee2b2edf58a
// source: https://ethereum.stackexchange.com/questions/137523/web3-js-contract-call-provider-does-not-have-a-request-or-send-method-to-use
if (window.ethereum) { 
  web3 = new Web3(window.ethereum);
  window.ethereum.request({ method: 'eth_requestAccounts' }); //changed from ethereum.enable() due to deprecation
} else {
  alert('Error');
}

export default web3;
