//SPDX-LICENSE-Identifier: unlicense

pragma solidity ^0.8.17;

contract Whitelist {
   //Max number of whitelisted address allowed
   uint8 public maxWhitelistedAddresses;

   //Created a mapping Whitelisted addresses allowed
   mapping(address => bool) public whitelistedAddresses;

  //numAddressesWhitelisted would be used to keep track
  uint8 public numAddressesWhitelisted;

  //Setting the max number of whitelisted addresses
  constructor(uint8 _maxWhitelistedAddresses) {
      maxWhitelistedAddresses = _maxWhitelistedAddresses;

  }
  //addAddressToWhitelist- This function adds the address of the sender to list
  function addAddressToWhitelist() public {
 // check if user already been added to list
      require(!whitelistedAddresses[msg.sender], "sender has already been whitelisted");
 // check if the numAddressesWhitelisted < maxWhitelistedAddresses, if not throw error
      require(numAddressesWhitelisted< maxWhitelistedAddresses, "more addresses can't be added, limit reached");
 // add the address that called the function to the whitelistedAddress array
      whitelistedAddresses[msg.sender] =true;
 // increase the number of addresses
      numAddressesWhitelisted += 1;

  }
}