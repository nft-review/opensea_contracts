/**
 *Submitted for verification at Etherscan.io on 2018-06-12
*/
// deployed: https://etherscan.io/address/0xa5409ec958c83c3f309868babaca7c86dcb077c1
pragma solidity ^0.4.13;

import './ProxyRegistry.sol';
import './AuthenticatedProxy.sol';

contract WyvernProxyRegistry is ProxyRegistry {

    string public constant name = "Project Wyvern Proxy Registry";

    /* Whether the initial auth address has been set. */
    bool public initialAddressSet = false;

    constructor ()
        public
    {
        delegateProxyImplementation = new AuthenticatedProxy(); // https://etherscan.io/address/0xf9e266af4bca5890e2781812cc6a6e89495a79f2
    }

    /** 
     * Grant authentication to the initial Exchange protocol contract
     *
     * @dev No delay, can only be called once - after that the standard registry process with a delay must be used
     * @param authAddress Address of the contract to grant authentication
     */
    function grantInitialAuthentication (address authAddress)
        onlyOwner
        public
    {
        require(!initialAddressSet);
        initialAddressSet = true;
        contracts[authAddress] = true;
    }

}
