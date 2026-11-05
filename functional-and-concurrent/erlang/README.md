# Erlang

Erlang is designed for distributed, concurrent, and fault-tolerant systems.

Official documentation: [Erlang documentation](https://www.erlang.org/doc/)

Run: `erlc hello.erl && erl -noshell -s hello main -s init stop`

## Concise introductory examples

[examples.erl](./examples.erl) introduces atoms, binaries, maps, lists, comments,
function clauses, pattern matching, comprehensions, immutable map updates,
tagged lookup results, and process messages with a receive timeout.

With Erlang/OTP available, run these commands from this directory:

```text
erlc examples.erl
erl -noshell -s examples main -s init stop
```

The lowercase filename matches `-module(examples)`. The program prints a shelf
catalog and receives an available-book count from a local worker process.
