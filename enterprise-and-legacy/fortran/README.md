# Fortran

Fortran is used for numerical, scientific, and high-performance computing.

Official documentation: [Fortran documentation](https://fortran-lang.org/learn/)

Run: `gfortran hello.f90 -o hello && ./hello`

## Concise introductory examples

[examples.f90](./examples.f90) introduces derived types, fixed-length strings,
logical values, arrays, comments, loops, conditionals, record assignment, array
component operations, intrinsic reductions, and an internal function with an
allocatable string result and an `intent(in)` parameter.

With GNU Fortran available, run
`gfortran -std=f2008 -Wall -Wextra -fcheck=all examples.f90 -o examples` from this
directory, then `./examples` on Unix or `.\examples.exe` in Windows PowerShell.
The self-contained program prints a shelf catalog, available titles, and an
original and copied record. No scientific libraries or input files are needed.
