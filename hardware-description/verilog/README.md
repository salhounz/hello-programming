# Verilog

Verilog describes and simulates digital electronic circuits.

Official documentation: [IEEE Verilog standard](https://standards.ieee.org/ieee/1364/3641/)

Run: `iverilog -o hello hello.v && vvp hello`

## Concise introduction

[examples.v](./examples.v) is a self-checking lookup-circuit simulation covering
bit vectors, a memory array, a function, conditionals, a loop, concurrent blocks,
clock edges, and nonblocking register assignments. Delays and stimulus belong to
the simulation testbench, rather than synthesizable board logic.

From this directory with Icarus Verilog installed, compile using
`iverilog -g2005 -s examples -o examples_sim examples.v`, then run
`vvp -N examples_sim`. Expect results 12, 85, 100, and 0; a mismatch prints ERROR
and stops. Icarus's -N option makes $stop exit with a failure status instead of
entering the interactive debugger. The explicit top module keeps the existing
hello example independent.
