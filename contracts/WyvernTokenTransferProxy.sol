/**
 *Submitted for verification at Etherscan.io on 2018-06-12
*/
// deployed: https://etherscan.io/address/0xe5c783ee536cf5e63e792988335c4255169be4e1
pragma solidity ^0.4.13;

import './TokenTransferProxy.sol';
import './ProxyRegistry.sol';

contract WyvernTokenTransferProxy is TokenTransferProxy {

    constructor (ProxyRegistry registryAddr)
        public
    {
        registry = registryAddr; // https://etherscan.io/address/0xa5409ec958c83c3f309868babaca7c86dcb077c1
    }
}