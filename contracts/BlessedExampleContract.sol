// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "hardhat/console.sol";

// import "@openzeppelin/contracts/utils/introspection/ERC165.sol";

// Blessed Description System
import "./blessed/Blessed.sol";     // the base mapping

// adding support for an Blessed capable license
import "./blessed/things/license/Cc0.sol";  

contract BlessedExampleContract is Blessed, Cc0 {
    address payable public owner;

    constructor() payable {
        owner = payable(msg.sender);
        // blessedAs["foo"]["bar"] = "bazz";

        // assert(keccak256(bytes(blessedAs['foo']['bar'])) == keccak256(bytes("zoo")));
        console.log("foo->bar = %s", blessedAs["foo"]["bar"]);
        console.log("license = %s", blessedAs["license"]["url"]);

        // Blessed isa = new Blessed();

    }
}
