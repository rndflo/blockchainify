pragma solidity 0.4.24;

import "zeppelin-solidity/contracts/token/ERC20/MintableToken.sol";

contract RealCoin is MintableToken {
    string public name = "REAL COIN";
    string public symbol = "REAL";
    uint8 public decimals = 18;
}