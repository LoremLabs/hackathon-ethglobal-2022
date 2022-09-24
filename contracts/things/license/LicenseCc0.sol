// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// import "hardhat/console.sol";

import "../Thing.sol";

contract LicenseCc0 is Thing {

    constructor() {
        attributes["slug"] = "cc0"; // type + id
        attributes["contact"] = '"Info" <info@creativecommons.org>'; 
        attributes["description"] = 'creative commons v0 license';
        attributes["url"] = "https://creativecommons.org/share-your-work/public-domain/cc0/";
    }
}
