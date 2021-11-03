pragma solidity ^0.4.13;

import './Ownable.sol';
import './TokenRecipient.sol';

contract DelegateProxy is TokenRecipient, Ownable {

    /**
     * Execute a DELEGATECALL from the proxy contract
     *
     * @dev Owner only
     * @param dest Address to which the call will be sent
     * @param calldata Calldata to send
     * @return Result of the delegatecall (success or failure)
     */
    function delegateProxy(address dest, bytes calldata)
        public
        onlyOwner
        returns (bool result)
    {
        return dest.delegatecall(calldata);
    }

    /**
     * Execute a DELEGATECALL and assert success
     *
     * @dev Same functionality as `delegateProxy`, just asserts the return value
     * @param dest Address to which the call will be sent
     * @param calldata Calldata to send
     */
    function delegateProxyAssert(address dest, bytes calldata)
        public
    {
        require(delegateProxy(dest, calldata));
    }

}
