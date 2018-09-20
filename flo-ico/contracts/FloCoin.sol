pragma solidity 0.4.19;

import 'zeppelin-solidity/contracts/token/ERC20/MintableToken.sol';

contract FloCoin is MintableToken {
    string public name = "FLO COIN";
    string public symbol = "FLO";
    uint8 public decimals = 18;
}