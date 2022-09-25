// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title Blessed
 * @dev Contract for adding Blessed referential attribute support interface
 */

contract Tagger {
    mapping(string => mapping(string => string)) public taggedAs;
    // string[] public tags;

    // should-really-have fields
    // taggedAs["license"]["slug"] = "license-cc0"; // type + id
    // taggedAs["license"]["address"] = "0x0"; // it's all strings all the way down

    // // optional fields...may not need these
    // taggedAs["license"]["name"] = "creative commons 0";
    // taggedAs["license"]["url"] = "https://creativecommons.org/share-your-work/public-domain/cc0/";
    // ...anything else you NEED
}
