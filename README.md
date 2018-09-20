# blockchainify
Token crowd sale smart contracts using Truffle and Zeppelin Solidity.

Truffle is the defacto framework for creating smart contrats and dapps.

## Steps
==> npm install -g ganache-cli
==> npm install -g truffle
==>  mkdir flo-ico && cd flo-ico
==> truffle init
==> npm init
==> npm install zeppelin-solidity
==> npm install zeppelin-solidity@1.7.0

==> truffle version
Truffle v4.1.14 (core: 4.1.14)
Solidity v0.4.24 (solc-js)

Create contracts/FloCoin.sol  with the following contents


~~~
pragma solidity 0.4.24;

import "zeppelin-solidity/contracts/token/ERC20/MintableToken.sol";

contract FloCoin is MintableToken {
    string public name = "FLO COIN";
    string public symbol = "FLO";
    uint8 public decimals = 18;
}
~~~

Create contracts/FloCoinCrowdsale.sol with the following contents

~~~
pragma solidity 0.4.24;

import "./FloCoin.sol";
import "zeppelin-solidity/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "zeppelin-solidity/contracts/crowdsale/validation/TimedCrowdsale.sol";


contract FloCoinCrowdsale is TimedCrowdsale, MintedCrowdsale {
    constructor 
        (
            uint256 _openingTime,
            uint256 _closingTime,
            uint256 _rate,
            address _wallet,
            MintableToken _token
        )
        public
        Crowdsale(_rate, _wallet, _token)
        TimedCrowdsale(_openingTime, _closingTime) {

        }
}
~~~

Add the following contents to truffle.js

~~~
module.exports = {
    networks: {
        development: {
            host: "localhost",
            port: 8545,
            network_id: "*" // Match any network id
        }
    }
};
~~~



Create migrations/2_deploy_contracts.js with the following contents

~~~
const FloCoinCrowdsale = artifacts.require('./FloCoinCrowdsale.sol');
const FloCoin = artifacts.require('./FloCoin.sol');

module.exports = function(deployer, network, accounts) {
    const openingTime = web3.eth.getBlock('latest').timestamp + 2; // two secs in the future
    const closingTime = openingTime + 86400 * 20; // 20 days
    const rate = new web3.BigNumber(1000);
    const wallet = accounts[1];

    return deployer
        .then(() => {
            return deployer.deploy(FloCoin);
        })
        .then(() => {
            return deployer.deploy(
                FloCoinCrowdsale,
                openingTime,
                closingTime,
                rate,
                wallet,
                FloCoin.address
            );
        });
};

~~~



==> truffle compile

==> truffle migrate


## Links

https://github.com/rndflo/blockchainify