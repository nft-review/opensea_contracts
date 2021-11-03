/**
 *Submitted for verification at Etherscan.io on 2018-06-12
 * 
 *deployed: https://etherscan.io/address/0x7be8076f4ea4a4ad08075c2508e481d6c946d12b
*/
pragma solidity ^0.4.13;

import './Exchange.sol';

import './ProxyRegistry.sol';
import './TokenTransferProxy.sol';
import './ERC20.sol';

contract WyvernExchange is Exchange {

    string public constant name = "Project Wyvern Exchange";

    string public constant version = "2.2";

    string public constant codename = "Lambton Worm";

    /**
     * @dev Initialize a WyvernExchange instance
     * @param registryAddress Address of the registry instance which this Exchange instance will use
     * @param tokenAddress Address of the token used for protocol fees
     */
    constructor (ProxyRegistry registryAddress, TokenTransferProxy tokenTransferProxyAddress, ERC20 tokenAddress, address protocolFeeAddress) public {

        /**
         * User Registry: WyvernProxyRegistry
         * https://etherscan.io/address/0xa5409ec958c83c3f309868babaca7c86dcb077c1
         */
        registry = registryAddress;

        /**
         * Token transfer proxy: WyvernTokenTransferProxy
         * https://etherscan.io/address/0xe5c783ee536cf5e63e792988335c4255169be4e1
         */
        tokenTransferProxy = tokenTransferProxyAddress;

        /**
         * The token used to pay exchange fees: WyvernToken
         * https://etherscan.io/address/0x056017c55ae7ae32d12aef7c679df83a85ca75ff
         */
        exchangeToken = tokenAddress; // 

        /**
         * Recipient of protocol fees: WyvernDAOProxy
         * https://etherscan.io/address/0xa839d4b5a36265795eba6894651a8af3d0ae2e68
         */
        protocolFeeRecipient = protocolFeeAddress;

        /**
         * owner of this contract (Ownable): WyvernDAOProxy
         * https://etherscan.io/address/0xa839d4b5a36265795eba6894651a8af3d0ae2e68#code
         */
        owner = msg.sender;
    }

}