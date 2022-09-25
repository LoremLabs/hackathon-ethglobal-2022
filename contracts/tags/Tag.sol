// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title Tag (Simple)
 * @dev Contract for defining Tags as part of the Tagged Contracts Protocol
 */

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract Tag is Ownable {
    event TagClaimIsActive(bool claimsEnabled);
    event TagClaimPriced(uint256 claimsPrice);
    event TagSet(string name, string value);

    mapping(string => string) internal attributes; // just storing data: "foo" = "bar"
    string[] public keys; // TODO: refacfor this and ^^

    // optional list of claims
    mapping(address => bool) public claimList;
    uint256 public claimPrice = 0.005 ether; // set to 0 if you want free claims
    uint256 public createBlockTimestamp;
    bool public claimsEnabled = false;
    string public tag;
    string public readmeTxt = "";
    string public claimReadmeTxt = "";

    constructor(string memory _tag) {
        createBlockTimestamp = block.timestamp;
        tag = _toLower(_tag); // license:cc0
    }

    //
    // attribute getters/setters
    //
    function set(string memory name, string memory value) public onlyOwner {
        attributes[name] = value;
        keys.push(name);
        emit TagSet(name, value);
    }

    function get(string memory name) public view returns (string memory) {
        return attributes[name];
    }

    function attributesJson() public view returns (string memory) {
        string memory serialized = "[";

        for (uint256 i = 0; i < keys.length; i++) {
            serialized = string.concat(
                serialized, // ["thing:here","0x0",
                '"',
                keys[i],
                '","',
                attributes[keys[i]],
                '"'
            );
            if (i < keys.length) {
                serialized = string.concat(serialized, ",");
            }
        }
        serialized = string.concat(serialized, "]");
        return serialized; //string(abi.encodePacked(serialized));
    }

    // string to lowercaes
    function _toLower(string memory str) internal pure returns (string memory) {
        bytes memory bStr = bytes(str);
        bytes memory bLower = new bytes(bStr.length);
        for (uint256 i = 0; i < bStr.length; i++) {
            if ((uint8(bStr[i]) >= 65) && (uint8(bStr[i]) <= 90)) {
                bLower[i] = bytes1(uint8(bStr[i]) + 32);
            } else {
                bLower[i] = bStr[i];
            }
        }
        return string(bLower);
    }

    //
    // readme functions
    //
    function setReadme(string memory _readme) public onlyOwner {
        readmeTxt = _readme;
    }

    function readme() public view returns (string memory) {
        return (readmeTxt);
    }

    //
    // claims functions: TODO allow purchase of claim by contract/user to prove ownership
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

    // TODO
    // function showProof(address) public {
    // }

    function setClaimReadme(string memory _claimReadme) public onlyOwner {
        claimReadmeTxt = _claimReadme;
    }

    function claimReadme() public view returns (string memory) {
        return (claimReadmeTxt);
    }
}
