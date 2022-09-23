// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title Blessed
 * @dev Contract for adding Blessed referential attribute support interface
 */

contract Blessed { 
    // map to 'cc0' => { name: 'creative commons 0', address: '0xabc', ... }
    mapping(string => mapping(string => string)) public blessedAs;
}
