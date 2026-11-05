# Ada

Ada is used for long-lived, high-integrity, and safety-critical systems.

Official documentation: [Ada Reference Manual](https://www.adaic.org/resources/add_content/standards/12rm/html/RM-TTL.html)

Run: `gnatmake hello.adb && ./hello`

## Concise introductory examples

[examples.adb](./examples.adb) introduces typed records, booleans, unbounded
strings, constants, comments, nested functions, unconstrained array types,
iteration, conditionals, scoped declarations, copies, and array attributes.

With GNAT available, run `gnatmake -gnat2012 examples.adb` from this directory,
then `./examples` on Unix or `.\examples.exe` in Windows PowerShell. The lowercase
basename matches procedure `Examples` under GNAT's naming rules. Only standard
Ada libraries are used; the program prints a shelf catalog and copied-record update.
