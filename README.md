# Liquid Staking Derivative Core

This repository provides a professional-grade implementation of a Liquid Staking Protocol. It solves the capital inefficiency problem of traditional staking by issuing a liquid representation of staked assets.

### Features
* **Tokenized Staking:** Users deposit ETH/Native tokens and receive `stToken` at a 1:1 ratio or based on an exchange rate.
* **Reward Distribution:** Staking rewards are accrued globally, increasing the value of `stToken` over time (Rebasing or Reward-bearing models).
* **Unstaking Queue:** A structured exit mechanism that manages the bonding/unbonding periods required by the underlying consensus layer.

### Protocol Components
* **LSD.sol:** The main entry point for deposits and minting logic.
* **StakingOracle.sol:** Feeds the consensus layer rewards back to the smart contract to update the exchange rate.
* **WithdrawalVault.sol:** Securely holds funds during the unbonding period.
