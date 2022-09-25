// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./tags/Tag.sol";

/*
 * This creates an example contract which can be queried to get "more info" about a tag.
 * Also called the "Tag Reference" this contract is a place to go to get more information.
 */
contract ExampleCC0Tag is Tag {

    constructor(string memory _tag) {
        // create the tag reference
        // Tag License = new Tag(_tag);
        // license = address(License); // for testing
        tag = _tag;

        // a readme provides a basic overview and should be included
        setTagReadme(
            "This tag refers to the Creative Commons CC0 License.\n"
            "CC0 (aka CC Zero) is a public dedication tool, which allows creators to give up their copyright and put their works into the worldwide public domain. CC0 allows reusers to distribute, remix, adapt, and build upon the material in any medium or format, with no conditions."
            "More information at https://creativecommons.org/share-your-work/public-domain/cc0/"
        );

        // these are optional, but could be useful to allow more granular querying
        setTag(
            "url",
            "https://creativecommons.org/share-your-work/public-domain/cc0/"
        );
        setTag("contact", '"Info" <info@creativecommons.org>'); // more info
        setTag("description", "creative commons v0 license");
        setTag("isa", "license");
        // ... and add more if needed...

        // Claims: Have your contract buy a license here by "buying a claim"

        // enable claims to allow contracts to "purchase" the thing.
        activateClaims(true);
        setTagClaimPrice(0.001 ether);

        // optional, setTagup a readme to show for people wanting info on claim purchase
        setTagClaimReadme(
            "Claims are available and entitle you to a license.\n"
            "Details may apply, please check our website for more information."
        );
    }
}
