// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/utils/introspection/ERC165.sol";
import "./Isa.sol";

contract IsaExampleContract is ERC165, Isa {
    address payable public owner;

    constructor() payable {
        owner = payable(msg.sender);
    }

    function supportsInterface(bytes4 interfaceId) public view virtual override(IERC165, ERC165) returns (bool) {
        return interfaceId == type(Isa).interfaceId || super.supportsInterface(interfaceId);
    }

}
