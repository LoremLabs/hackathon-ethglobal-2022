// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title Tag (Simple)
 * @dev Contract for defining Tags as part of the Tagged Contracts Protocol
 */

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract Tag is Ownable {
    // this is the simple version, which isn't upgradable
    event TagCreated(
        string isa,
        string slug, // short-name
        uint256 blockTimestamp
    );
    event TagClaimIsActive(bool claimsEnabled);
    event TagClaimPriced(uint256 claimsPrice);
    event TagSet(string name, string value);

    mapping(string => string) internal attributes; // just storing data: "foo" = "bar"

    // optional list of claims
    mapping(address => bool) public claimList;
    uint256 public claimPrice = 0.005 ether; // set to 0 if you want free claims
    uint256 public createBlockTimestamp;
    bool public claimsEnabled = false;

    constructor(string memory thingIsa, string memory thingSlug) {
        //        _transferOwnership(_owner);
        createBlockTimestamp = block.timestamp;
        attributes["isa"] = thingIsa;
        attributes["slug"] = thingSlug;
        emit TagCreated(thingIsa, thingSlug, createBlockTimestamp);
    }

    //
    // attribute getters/setters
    //
    function set(string memory name, string memory value) public onlyOwner {
        attributes[name] = value;
        emit TagSet(name, value);
    }

    function get(string memory name) public view returns (string memory) {
        return attributes[name];
    }

    //
    // claims functions
    //
    function activateClaims(bool _claimsEnabled) public onlyOwner {
        claimsEnabled = _claimsEnabled;
        emit TagClaimIsActive(claimsEnabled);
    }

    function setClaimPrice(uint256 _claimPrice) public onlyOwner {
        require(_claimPrice >= 0, "INVALID CLAIM PRICE");
        claimPrice = _claimPrice;
        emit TagClaimPriced(claimPrice);
    }
}
