# Tags

`Tagger.sol` is the top-level contract to include to get basic `Tags` support.

```
import "./tags/Tagger.sol";     // the base mapping
```

## Adding in Tag Libraries ("Taggers")

```
// adding support for a Tagger capable license
import "./tags/taggers/license/Cc0.sol";  
```

## Manually adding in your Contract

```

contract TaggerManualExampleContract is Tagger {

    constructor() payable {

    // manual set state via conventions
    taggedAs["license"]["slug"] = "license-cc0"; // type + id
    taggedAs["license"]["address"] = "0x0"; // it's all strings all the way down

    // optional fields...may not need these
    taggedAs["license"]["name"] = "creative commons 0";
    taggedAs["license"]["url"] = "https://creativecommons.org/share-your-work/public-domain/cc0/";


    }
}

```

# Example 

## Using a Thing in your own project

```
pragma solidity ^0.8.9;

import "hardhat/console.sol";

// Tagger Description System
import "./tags/Tagger.sol";     // the base mapping

// adding support for a Tagger capable license
import "./tags/taggers/license/Cc0.sol";  

contract TaggerExampleContract is Tagger, Cc0 {
    constructor() payable {
        console.log("license = %s", taggedAs["license"]["url"]);
    }
}
```

Users can lookup the Tag at the address from more information.


## File to Mapping Conventions

The `things` directory should correspond to the `Tagger Things` mappings. So the first directory inside will be the first `taggedAs` parameter–ex: `things/license`. Inside the `things/license` directory the files will correspond to the inner mapping, for instance `things/license/Cc0.sol` would be responsible for setting the `tagsAt['license']['Cc0']` namespace.

You should be able to open up a repository and go to `contracts/tags` and get an idea about what particular things this contract uses.
