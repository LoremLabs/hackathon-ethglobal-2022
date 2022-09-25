// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "hardhat/console.sol";

// import "@openzeppelin/contracts/utils/introspection/ERC165.sol";

import "./blessed/Thing.sol";

contract ExampleCC0Thing {
    bool public tf = true;
    address public license;
    address public owner;

    constructor() {
        owner = msg.sender;

        Thing License = new Thing("license", "cc0"); // (isA, slug)
        license = address(License);

        // these are optional, but should have to make useful
        License.set(
            "url",
            "https://creativecommons.org/share-your-work/public-domain/cc0/"
        );
        License.set("contact", '"Info" <info@creativecommons.org>'); // more info
        License.set("description", "creative commons v0 license");
        // ... and add more if needed...

        // enable claims list
        License.activateClaims(true);
        License.setClaimPrice(0.001 ether);
    }
}
