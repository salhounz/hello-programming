# Move

Move is a resource-oriented language for blockchain smart contracts.

Official documentation: [Move documentation](https://move-language.github.io/move/)

Use: Add `hello.move` to a Move package and build it with that platform's Move CLI.

## Concise introduction

[examples.move](./examples.move) targets Aptos Move, with structs and abilities,
byte vectors, typed values, constants, local functions, immutable/mutable borrows,
IF, WHILE, ownership-consuming destructuring, and a local unit test. It does not
publish a resource or submit a transaction; other Move platforms may differ.

Use an existing Aptos package with its standard-library dependencies already
available. Copy only this file into that package's sources/examples.move.
The manifest needs `[addresses]` with `example_addr = "_"`; if already set to a
concrete address, use that value instead. From the package directory run
`aptos move compile --named-addresses example_addr=0x42` and
`aptos move test --named-addresses example_addr=0x42 --filter local_inventory`.
The test borrows the last copy and checks that two sample titles are available.
No account setup, funds, or deployment is required. Package dependencies must
match the installed Aptos CLI; this repository is not a complete Move package.

See the official [Aptos package/dependency documentation](https://aptos-labs.github.io/move-book/modules-and-packages.html)
for manifest and named-address resolution.
