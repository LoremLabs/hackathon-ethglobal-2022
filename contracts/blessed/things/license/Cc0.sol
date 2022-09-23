// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// import "hardhat/console.sol";

// import "@openzeppelin/contracts/utils/introspection/ERC165.sol";
import "../../Blessed.sol";

contract Cc0 is Blessed {

    constructor() payable {

        blessedAs["license"]["name"] = "creative commons 0";
        blessedAs["license"]["url"] = "https://creativecommons.org/share-your-work/public-domain/cc0/";
    }
}
