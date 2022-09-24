// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "hardhat/console.sol";

// import "@openzeppelin/contracts/utils/introspection/ERC165.sol";

// import "./things/license/LicenseCc0.sol";

contract ExampleCC0Thing {

    bool public tf = true;

    constructor() {
    }

    function doinit() public returns (bool) {

        // configure our Thing -- Thing(isA, slug-name)
        // a Thing is just a public mapping
//   license = new Thing("license", "cc0"); // (isA, slug)
//   license = new Thing(); // (isA, slug)

//         // these are optional, but should have to make useful
//         license.set('url', 'https://creativecommons.org/share-your-work/public-domain/cc0/');
//         license.set('contact', '"Info" <info@creativecommons.org>'); // more info
//         license.set('description', 'creative commons v0 license');
//         // ... and add more if needed...

//         // enable claims list
//         license.activateClaims(true);
//         license.setClaimPrice(0.001 ether);
tf = false;
return tf;
    }
}
