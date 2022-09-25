// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// import "hardhat/console.sol";

// import "@openzeppelin/contracts/utils/introspection/ERC165.sol";
import "../../Tagger.sol";

contract Cc0 is Tagger {
    constructor() payable {
        // must have field: you'll need to deploy the Thing first to get the address
        taggedAs["license"]["address"] = "0x04943a8D464aC4f988453FD3690C85A6CEb2C66c"; // TODO(you): write the address here!

        // should-really-have fields
        taggedAs["license"]["slug"] = "license-cc0"; // type + id

        // optional fields...may not need these
        taggedAs["license"]["name"] = "creative commons 0";
        taggedAs["license"][
            "url"
        ] = "https://creativecommons.org/share-your-work/public-domain/cc0/";
    }
}
