// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// import "hardhat/console.sol";

// import "@openzeppelin/contracts/utils/introspection/ERC165.sol";

// adding support for a Tag-capable license
import "./tags/Tagger.sol";

contract ExampleTaggedContract is Tagger {
    constructor() {
        // setup our public tags and responding refs
        // recommend using a : as delimeter of hierarchies
        setTag("license:cc0", "0x04943a8D464aC4f988453FD3690C85A6CEb2C66c"); // reference to more info
        setTag("author:matt-mankins"); // simple tag
        setTag("Example"); // simpler tag :), stored as lowercase

        // externally: get all with jsonTags()
        // internally: existsTag(tag) or getTagRef(tag)
    }
}
