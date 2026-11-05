# Vyper

Vyper is a Python-inspired language for secure Ethereum smart contracts.

Official documentation: [Vyper documentation](https://docs.vyperlang.org/)

Run: `vyper hello.vy`

## Concise introduction

[examples.vy](./examples.vy) targets Vyper 0.4.1 through compatible 0.4.x releases.
It introduces bounded strings, a struct, bounded dynamic array, storage, a
constant, deployment initializer, internal/external functions, asserts, tuple
returns, and a bounded loop. Only the librarian may add books; anyone may borrow
in this small learning model.

From this directory run `vyper -f abi,bytecode examples.vy` with an existing
compatible compiler. Compilation does not deploy anything. In a local EVM tool
that accepts ABI/bytecode, deploy that output with no constructor arguments;
call summary(0), borrow(0), and available_titles(). Initially both titles are
available; after three borrows of book 0, summary(0) returns Dune/false and the
available-title count is 1. A fourth borrow reverts. Use the deploying account
for add_book. No payments or public network are required.

See the official [Vyper control structures](https://docs.vyperlang.org/en/v0.4.1/control-structures.html)
for the 0.4.x initializer, internal calls, and typed loop syntax.
