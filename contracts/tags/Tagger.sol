// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title Tagger
 * @dev Contract for adding Tags to contracts: use this one inside your contracts
 * @author Matt Mankins <matt@loremlabs.com>
 */

contract Tagger {
    event TagSet(string name, string value);

    // tags are free-form strings (lowercased) and an optional reference address (as a hex string)
    struct Tags {
        string tag; // raw tag
        string ref; // the address AS A STRING for more info 0x0 (tradeoff to save code complexity)
    }

    Tags[] internal tags;
    string internal constant NO_TAG_REF = "0x0"; // or 0xffffffff ? -- used when tag has no ref address

    // setTag("license:cc0", "0xabc123")
    function setTag(string memory _toTag, string memory _toTagRef) internal {
        // TODO: should not contain "
        tags.push(Tags(_toLower(_toTag), _toTagRef));
        emit TagSet(_toLower(_toTag), _toTagRef);
    }

    function setTag(string memory _toTag) internal {
        // TODO: should not contain "
        tags.push(Tags(_toLower(_toTag), NO_TAG_REF));
        emit TagSet(_toLower(_toTag), NO_TAG_REF);
    }

    // check to see if this tag is already there, regardless of ref address
    // existsTag("license:cc0") => true
    function existsTag(string memory _tag) public view returns (bool) {
        bytes32 lookingFor = keccak256(abi.encodePacked(_toLower(_tag)));
        for (uint256 i = 0; i < tags.length; i++) {
            if (lookingFor == keccak256(abi.encodePacked(tags[i].tag))) {
                return true;
            }
        }
        return false;
    }

    // getTagRef("license:cc0") => "0x0abc"
    function getTagRef(string memory _tag) public view returns (string memory) {
        bytes32 lookingFor = keccak256(abi.encodePacked(_toLower(_tag)));
        for (uint256 i = 0; i < tags.length; i++) {
            if (lookingFor == keccak256(abi.encodePacked(tags[i].tag))) {
                return tags[i].ref;
            }
        }
        return "";
    }

    // TODO: delete, clear, etc.

    // super basic: ["tag1","tag1Address","tag2",...]
    function jsonTags() public view returns (string memory) {
        string memory serialized = "[";

        for (uint256 i = 0; i < tags.length; i++) {
            serialized = string.concat(
                serialized, // ["thing:here","0x0",
                '"',
                _toLower(tags[i].tag),
                '","',
                tags[i].ref,
                '"'
            );
            if (i < tags.length -1) {
                serialized = string.concat(serialized, ",");
            }
        }
        serialized = string.concat(serialized, "]");
        return serialized; //string(abi.encodePacked(serialized));
    }

    // string to lowercase
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
}
