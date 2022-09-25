// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title Thing (Simple)
 * @dev Contract for defining Thing references for Blessed Things Protocol
 */

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract Thing is Ownable {
    // this is the simple version, which isn't upgradable
    event ThingCreated(
        string isa,
        string slug, // short-name
        uint256 blockTimestamp
    );
    event ThingClaimIsActive(bool claimsEnabled);
    event ThingClaimPriced(uint256 claimsPrice);
    event ThingSet(string name, string value);

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
        emit ThingCreated(thingIsa, thingSlug, createBlockTimestamp);
    }

    //
    // attribute getters/setters
    //
    function set(string memory name, string memory value) public onlyOwner {
        attributes[name] = value;
        emit ThingSet(name, value);
    }

    function get(string memory name) public view returns (string memory) {
        return attributes[name];
    }

    //
    // claims functions
    //
    function activateClaims(bool _claimsEnabled) public onlyOwner {
        claimsEnabled = _claimsEnabled;
        emit ThingClaimIsActive(claimsEnabled);
    }

    function setClaimPrice(uint256 _claimPrice) public onlyOwner {
        require(_claimPrice >= 0, "INVALID CLAIM PRICE");
        claimPrice = _claimPrice;
        emit ThingClaimPriced(claimPrice);
    }
}
