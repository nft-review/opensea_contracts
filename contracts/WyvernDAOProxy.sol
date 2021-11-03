/**
 *Submitted for verification at Etherscan.io on 2018-03-08
*/
// deployed: https://etherscan.io/address/0xa839d4b5a36265795eba6894651a8af3d0ae2e68

pragma solidity ^0.4.13;

import './DelegateProxy.sol';

contract WyvernDAOProxy is DelegateProxy {

    constructor ()
        public
    {
        owner = msg.sender;
    }

}