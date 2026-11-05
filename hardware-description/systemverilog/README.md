# SystemVerilog

SystemVerilog is used to design and verify digital electronic systems.

Official documentation: [IEEE SystemVerilog standard](https://standards.ieee.org/ieee/1800/7743/)

Run: `iverilog -g2012 -o hello hello.sv && vvp hello`

## Concise introduction

[examples.sv](./examples.sv) demonstrates logic vectors, enum states, packed
structs, an unpacked array, an automatic function, always_ff, case, foreach, and
an immediate assertion in a self-contained simulation. Testbench timing is not
board-ready hardware.

Use Verilator 5 with a configured C++ build toolchain for this example's struct
array support. From this directory in a POSIX shell or WSL, run
`verilator --binary --timing --top-module examples examples.sv`, then
`./obj_dir/Vexamples`. For a check without building, use
`verilator --lint-only --timing --top-module examples examples.sv`.
The simulation prints the samples and asserts peak=40, ignoring the invalid 99.
