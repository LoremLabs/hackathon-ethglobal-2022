// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// import "hardhat/console.sol";

// import "@openzeppelin/contracts/utils/introspection/ERC165.sol";

// adding support for a Tag-capable license
import "./tags/taggers/license/Cc0.sol";

contract TaggerExampleContract is Cc0 {
    event ShowTagProperty(string name, string value);

    constructor() payable {
        // manually set blessed things if needed
        // blessedAs["foo"]["bar"] = "bazz";

        // for debugging we could:
        // assert(keccak256(bytes(blessedAs['license']['slug'])) == keccak256(bytes("license-cc0")));
        // console.log("license = %s", blessedAs["license"]["url"]);
        // console.log("foo bar %s", blessedAs["foo"]["bar"]);
        emit ShowTagProperty("license:slug", taggedAs["license"]["slug"]);
    }
}
