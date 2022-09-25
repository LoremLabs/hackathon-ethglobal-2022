// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// import "hardhat/console.sol";

// import "@openzeppelin/contracts/utils/introspection/ERC165.sol";
import "../../Blessed.sol";

contract Cc0 is Blessed {
    constructor() payable {
        // must have field: you'll need to deploy the Thing first to get the address
        blessedAs["license"]["address"] = "0x0"; // TODO(you): write the address here!

        // should-really-have fields
        blessedAs["license"]["slug"] = "license-cc0"; // type + id

        // optional fields...may not need these
        blessedAs["license"]["name"] = "creative commons 0";
        blessedAs["license"][
            "url"
        ] = "https://creativecommons.org/share-your-work/public-domain/cc0/";
    }
}
