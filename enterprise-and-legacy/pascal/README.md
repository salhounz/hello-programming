# Pascal

Pascal is used for structured programming education and application development.

Official documentation: [Free Pascal documentation](https://www.freepascal.org/docs.html)

Run: `fpc hello.pas && ./hello`

## Concise introductory examples

[examples.pas](./examples.pas) introduces typed records, strings, booleans,
comments, arrays, functions, procedures, `const` versus `var` parameters,
conditionals, loops, bounds intrinsics, and record copying using a shelf catalog.

From this directory, run `fpc -Mobjfpc -Sh -Cr examples.pas` with Free Pascal,
then `./examples` on Unix or `.\examples.exe` in Windows PowerShell. The source
also selects ObjFPC mode and long strings explicitly. It uses only the runtime
library and prints book statuses, an available count, and a borrowed copy.
