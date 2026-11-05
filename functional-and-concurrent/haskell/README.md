# Haskell

Haskell is a purely functional language used in research and strongly typed applications.

Official documentation: [Haskell documentation](https://www.haskell.org/documentation/)

Run: `runghc hello.hs`

## Concise introductory examples

[examples.hs](./examples.hs) introduces typed records, strings, booleans, lists,
comments, pure functions, pattern matching, function composition, comprehensions,
record updates, `Maybe` lookup results, and sequenced `IO` actions.

From this directory, run `runghc examples.hs` with GHC and its bundled `base` and
`containers` packages available. No additional dependencies are used. It prints
a shelf catalog, available and fiction titles, and a keyed lookup result.
