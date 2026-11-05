# COBOL

COBOL is used for business, finance, and government transaction-processing systems.

Official documentation: [IBM Enterprise COBOL documentation](https://www.ibm.com/docs/en/cobol-zos)

Run: `cobc -x hello.cob && ./hello`

## Concise introductory examples

[examples.cob](./examples.cob) introduces `PICTURE` fields, strings, numeric
storage, comments, an `OCCURS` table, level-88 condition names, `PERFORM` loops,
reusable paragraphs, `EVALUATE`, intrinsic `TRIM`, and edited numeric output.

With GnuCOBOL 3.x available, run `cobc -free -Wall -x -o examples examples.cob`
from this directory, then `./examples` on Unix or `.\examples.exe` in Windows
PowerShell. The source also declares free format explicitly and enables intrinsic
function names through `REPOSITORY` as described in the
[GnuCOBOL guide](https://gnucobol.sourceforge.io/HTML/gnucobpg.html).
The program prints an in-memory shelf catalog and available-book count.
