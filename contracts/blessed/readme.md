# Blessed Things

`Blessed.sol` is the top-level contract to include to get basic `Blessed Things` support.

```
import "./blessed/Blessed.sol";     // the base mapping
```

## Adding in other Blessed Things

```
// adding support for a Blessed capable license
import "./blessed/things/license/Cc0.sol";  
```

## Manually adding in your Contract

```

contract BlessedManualExampleContract is Blessed {

    constructor() payable {

    // manual set state via conventions
    blessedAs["license"]["slug"] = "license-cc0"; // type + id
    blessedAs["license"]["address"] = "0x0"; // it's all strings all the way down

    // optional fields...may not need these
    blessedAs["license"]["name"] = "creative commons 0";
    blessedAs["license"]["url"] = "https://creativecommons.org/share-your-work/public-domain/cc0/";


    }
}

```

# Example 

## Using a Thing in your own project

```
pragma solidity ^0.8.9;

import "hardhat/console.sol";

// Blessed Description System
import "./blessed/Blessed.sol";     // the base mapping

// adding support for a Blessed capable license
import "./blessed/things/license/Cc0.sol";  

contract BlessedExampleContract is Blessed, Cc0 {
    constructor() payable {
        console.log("license = %s", blessedAs["license"]["url"]);
    }
}
```

Users can lookup the Thing at the address from more information.


## File to Mapping Conventions

The `things` directory should correspond to the `Blessed Things` mappings. So the first directory inside will be the first `blessedAs` parameter–ex: `things/license`. Inside the `things/license` directory the files will correspond to the inner mapping, for instance `things/license/Cc0.sol` would be responsible for setting the `blessedAt['license']['Cc0']` namespace.

You should be able to open up a repository and go to `contracts/blessed` and get an idea about what particular things this contract uses.
