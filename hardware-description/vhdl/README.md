# VHDL

VHDL describes and simulates digital electronic systems.

Official documentation: [IEEE VHDL standard](https://standards.ieee.org/ieee/1076/5179/)

Run: `ghdl -a hello.vhd && ghdl -e hello && ghdl -r hello`

## Concise introduction

[examples.vhd](./examples.vhd) introduces constrained types, an array constant,
signals, a pure function, concurrent assignment, clocked processes, IF, FOR,
numeric_std conversions, and assertions. This is a VHDL-2008 simulation testbench;
the timed clock and stimulus are simulation constructs.

From this directory with GHDL installed, run these commands in order:
`ghdl -a --std=08 examples.vhd`, `ghdl -e --std=08 examples`, and
`ghdl -r --std=08 examples --assert-level=error`. Expect reports for 12, 85, 100,
and 0 before std.env.finish stops the simulation. Assertion mismatches fail.
