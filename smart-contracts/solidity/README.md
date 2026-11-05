# Solidity

Solidity is used to write smart contracts for Ethereum-compatible blockchains.

Official documentation: [Solidity documentation](https://docs.soliditylang.org/)

Run: `solc Hello.sol`

## Concise introduction

[examples.sol](./examples.sol) demonstrates structs, a dynamic storage array,
mapping, immutable address, constructor, modifier, events, guards, functions,
storage references, tuple returns, and a bounded loop. The lowercase filename
contains contract Examples; Solidity does not require those names to match.

From this directory run `solc --abi --bin examples.sol` with Solidity 0.8.20+.
To exercise it, paste the source into Remix, select a compatible 0.8.x compiler,
compile Examples, and deploy using **Remix VM**. As the deploying account, call
enroll with that account's address, then borrow(0), summary(0), and
availableTitles(). Summary returns Dune/true and the count remains 2. Repeat
borrow(0) until the fourth attempt reverts. No funds or public chain are needed.
