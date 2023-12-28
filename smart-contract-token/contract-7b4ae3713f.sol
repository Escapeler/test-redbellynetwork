// SPDX-License-Identifier: MM
pragma solidity ^0.8.20;

import "@openzeppelin/contracts-upgradeable@5.0.1/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable@5.0.1/token/ERC20/extensions/ERC20BurnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable@5.0.1/access/manager/AccessManagedUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable@5.0.1/token/ERC20/extensions/ERC20PermitUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable@5.0.1/proxy/utils/Initializable.sol";

/// @custom:security-contact escapelernode@gmail.com
contract Mamung is Initializable, ERC20Upgradeable, ERC20BurnableUpgradeable, AccessManagedUpgradeable, ERC20PermitUpgradeable {
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize(address initialAuthority) initializer public {
        __ERC20_init("Mamung", "MM");
        __ERC20Burnable_init();
        __AccessManaged_init(initialAuthority);
        __ERC20Permit_init("Mamung");

        _mint(msg.sender, 10000000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public restricted {
        _mint(to, amount);
    }
}
