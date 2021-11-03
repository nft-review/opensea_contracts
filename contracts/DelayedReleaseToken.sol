pragma solidity ^0.4.13;

import './StandardToken.sol';

contract DelayedReleaseToken is StandardToken {

    /* Temporary administrator address, only used for the initial token release, must be initialized by token constructor. */
    address temporaryAdmin;

    /* Whether or not the delayed token release has occurred. */
    bool hasBeenReleased = false;

    /* Number of tokens to be released, must be initialized by token constructor. */
    uint numberOfDelayedTokens;

    /* Event for convenience. */
    event TokensReleased(address destination, uint numberOfTokens);

    /**
     * @dev Release the previously specified amount of tokens to the provided address
     * @param destination Address for which tokens will be released (minted) 
     */
    function releaseTokens(address destination) public {
        require((msg.sender == temporaryAdmin) && (!hasBeenReleased));
        hasBeenReleased = true;
        balances[destination] = numberOfDelayedTokens;
        emit Transfer(address(0), destination, numberOfDelayedTokens); 
        emit TokensReleased(destination, numberOfDelayedTokens);
    }

}
