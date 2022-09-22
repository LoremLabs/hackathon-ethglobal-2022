# IsA Thing Protocol - EthGlobal 2022 Hackathon

`IsA Thing` imagines a metadata layer where tangential but related information can be stored on the blockchain in a consistent way.

## Motivation and Inspiration

The initial motivating use case is to provide a uniform way to add license information to NFTs to help answer questions like "What rights do I have if I own this NFT?".

There have been [numerous](https://www.nftlicense.org/) [attempts](https://www.nftstandards.wtf/NFT/NFT+License) to [standardize](https://eips.ethereum.org/EIPS/eip-5554) and clarify licensing rights for NFTs, however there remains a lack of consensus on how to locate the license for an NFT. 

We are inspired by conversations [we have had](https://twitter.com/creativecommons/status/1537242121647706112) with the Creative Commons organization, as well as existing work such as the [Royalties Registry](https://royaltyregistry.xyz/) and [EIP-2981](https://eips.ethereum.org/EIPS/eip-2981) which we implemented when we created our own NFT, [Kevin the Balloon](https://www.kevintheballoon.com/).

## Approach

We could follow through with the approach outlined in the ["NFT Licensing Protocol Idea"](https://www.nftstandards.wtf/NFT/NFT+License) and reach a good approximate solution to answer the question "What License does this NFT have?". Yet we question if a more general solution is needed that transcends the specifics of licensing and instead allows for the creation of a general-purpose tangential attribute store that could then be used to store license data.

By using the general purpose data structure and taxonomy conventions we imagine a contract authors being able to create an ecosystem of tangential attribute data stored on the blockchain.

## Tangential Attributes: IsA Thing

We use the term "tangential attributes" to include data whose source is defined by another address. We call this referred address the `IsA`. Contracts that implement this protocol will define themselves as a `Thing`–for instance Things may be a License, Entitlement, Description, or some other "thing".

Tangential attributes are defined in a top-level contract map, whose keys are set by convention, and could grow in a fashion similar to the [Service Name and Transport Protocol Port Number Registry](https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.xhtml) used for TCP/UDP ports. Values are maps themselves and include at least an address and type field.

# Usage

TKTK

# Creating Things

TKTK

# Linking with IsA Library

# Tests

```
% npx hardhat run scripts/test.js --network mainnet --verbose 
```
