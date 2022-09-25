# Tagged Contracts Protocol - EthGlobal 2022 Hackathon

`Tagged Contracts` imagines a composable metadata layer where free-form information can be stored on the blockchain in a consistent way that is easy for developers and users alike. *Think: Docker tags, for smart contracts.*

```
        // inside your contract / NFT
        Tagger License = new Tag("license", "cc0"); // (isA, slug)

        // these are optional, but should have to make useful set(key,val)
        Tagger.set(
            "url",
            "https://creativecommons.org/share-your-work/public-domain/cc0/"
        );
        Tagger.set("contact", '"Info" <info@creativecommons.org>'); // more info
        Tagger.set("description", "creative commons v0 license");
        // ... and add more if needed...

```

## Motivation and Inspiration

The initial motivating use case is to provide a uniform way to add license information to NFTs to help answer questions like "What rights do I have if I own this NFT?".

There have been [numerous](https://www.nftlicense.org/) [attempts](https://www.nftstandards.wtf/NFT/NFT+License) to [standardize](https://eips.ethereum.org/EIPS/eip-5554) and clarify licensing rights for NFTs, however there remains a lack of consensus on how to locate the license for an NFT.

We are inspired by conversations [we have had](https://twitter.com/creativecommons/status/1537242121647706112) with the Creative Commons organization, as well as existing work such as the [Royalties Registry](https://royaltyregistry.xyz/) and [EIP-2981](https://eips.ethereum.org/EIPS/eip-2981) which we implemented when we created our own NFT, [Kevin the Balloon](https://www.kevintheballoon.com/).

Incidentally, the term `blessed` is inspired by Perl's [blessed refererents](https://www.perl.com/pub/1999/09/refererents.html/) which is inspirational for this design too.

We also imagine that applications like Etherscan could use our tagging feature to display the properties of contracts instead of requiring [manual configuration of labels](https://info.etherscan.com/public-name-tags-labels/).

## Referential Attributes: Tags

We use the term "referential attributes" to include data whose source is defined by another address. We call this referred address the `Blessed Tag`. Contracts that implement this protocol will define their tags in a unique mapping namespace–for instance a Tag may represent a License, Entitlement, Description, or some other "thing".

Tags are defined in a top-level contract map, whose keys are set by convention, and could grow in a fashion similar to the [Service Name and Transport Protocol Port Number Registry](https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.xhtml) used for TCP/UDP ports. Values are maps themselves and include at least an address and type field.

## Approach

We could follow through with the approach outlined in the ["NFT Licensing Protocol Idea"](https://www.nftstandards.wtf/NFT/NFT+License) and reach a good approximate solution to answer the question "What License does this NFT have?".

Yet we question if a more general solution is needed that transcends the specifics of licensing and instead allows for the creation of a general-purpose tangential attribute store that could then be used to store license data.

By using the general purpose data structure and taxonomy conventions we imagine a contract authors being able to create an ecosystem of referential attribute data stored on the blockchain.

We considered an approach similar to [EIP-165](https://eips.ethereum.org/EIPS/eip-165) where the hash of attributes dictated an agreed-upon definition of the attribute. Yet these are more difficult to create the merely setting a string value. Indeed [EIP-1616](https://eips.ethereum.org/EIPS/eip-1616) attempted to do something similar but ultimately the approach was abandoned.

Instead, we chose to fix the place where `blessed things` live within the contract via a multi-dimensional mapping, and rely on convention of attribute names. This allows for top-level taxonomies, like {LICENSE, SUPPORTED_BY, HOMEPAGE} which can have domain-specific fields–ideally kept to the absolute minimum: the name, and an address to the referential address–the `Blessed Thing Definition`, itself a contract on the blockchain.

We can then provide consistent functions to answer common use cases:

- "What license is this contract covered by?"
- "What third parties can I go to if I need support?"

## Referring to Tags Via Contracts

We recommend that `Tag Contracts` be deployed as a Proxy Contract to allow the definition of the `Tag`–for example the Creative Commons License, v0–to evolve over time. Should a contract wish to refer to a non-malleable definition for a Tag, it would simply refer to a fixed, non-upgradable contract.

Contract deployers can use a `associate()` function on `Tag Contracts` to show that they support a given Thing. This reverse-map can be used to power user-interfaces to prove connections between parties. A double-opt-in could be imagined where the `Tag Contract` executes an `confirmAssociation()` function on the child contract.

It should be noticed that `Tag Contracts` are completely optional and use-case dependent.

# Usage

TKTK

# Creating Things

TKTK

# Linking with IsA Library

# Tests

```
% npx hardhat run scripts/test.js --network mainnet --verbose
```
