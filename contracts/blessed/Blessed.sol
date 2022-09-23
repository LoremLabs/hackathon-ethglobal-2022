// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title Blessed
 * @dev Contract for adding Blessed referential attribute support interface
 */

contract Blessed {
    mapping(string => mapping(string => string)) public blessedAs;

    // should-really-have fields
    // blessedAs["license"]["slug"] = "license-cc0"; // type + id
    // blessedAs["license"]["address"] = "0x0"; // it's all strings all the way down

    // // optional fields...may not need these
    // blessedAs["license"]["name"] = "creative commons 0";
    // blessedAs["license"]["url"] = "https://creativecommons.org/share-your-work/public-domain/cc0/";
    // ...anything else you NEED
}
