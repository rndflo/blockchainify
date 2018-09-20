# blockchainify
Token crowd sale smart contracts using Truffle and Zeppelin Solidity.

Truffle is the defacto framework for creating smart contrats and dapps.

## Steps
==> npm install -g ganache-cli
==> npm install -g truffle
==>  mkdir flo-ico && cd flo-ico
==> npm init
==> truffle init
==> npm install zeppelin-solidity
==> npm install zeppelin-solidity@1.7.0

==> truffle version
Truffle v4.1.14 (core: 4.1.14)
Solidity v0.4.24 (solc-js)

==> truffle console

// The account that will buy FLO tokens.
> purchaser = web3.eth.accounts[2]

// The address of the FLO token instance that was created when the crowdsale contract was deployed

> FloCoinCrowdsale.deployed().then(inst => { crowdsale = inst })

> crowdsale.token().then(addr => { tokenAddress = addr } )

> tokenAddress

> floCoinInstance = FloCoin.at(tokenAddress)

// change token ownership to crowdsale so it is able to mint tokens during crowdsale

> floCoinInstance.transferOwnership(crowdsale.address)

// Now check the number of FLO tokens purchaser has. It should have 0

> floCoinInstance.balanceOf(purchaser).then(balance => balance.toString(10))

// Buying FLO tokens

> FloCoinCrowdsale.deployed().then(inst => inst.sendTransaction({ from: purchaser, value: web3.toWei(5, "ether")}))


// Check amount of FLO tokens for purchaser again. It should have some now

> truffle(development)> floCoinInstance.balanceOf(purchaser).then(balance => purchaserFloTokenBalance = balance.toString(10))

// When we created our token we made it with 18 decimals, which the same as what ether has. 
// That's a lot of zeros, let's display without the decimals:

> web3.fromWei(purchaserFloTokenBalance, "ether")

## Links

https://blog.zeppelin.solutions/how-to-create-token-and-initial-coin-offering-contracts-using-truffle-openzeppelin-1b7a5dae99b6