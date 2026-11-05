# ABAP

ABAP is used to build and extend business applications in SAP systems.

Official documentation: [ABAP documentation](https://help.sap.com/docs/abap-cloud/abap-concepts/about)

Use: Run `hello.abap` as an executable program in an SAP ABAP system.

## Concise introductory examples

[examples.abap](./examples.abap) introduces typed structures, strings, booleans,
internal tables, comments, a local class with a returning method, loops,
conditionals, string templates, and `READ TABLE` with `sy-subrc` handling.

Use a classic SAP ABAP 7.40+ system supporting `VALUE`, inline declarations, and
string templates. In transaction SE38, create executable program `ZINTRO_EXAMPLES`,
paste the complete file (including `REPORT zintro_examples`), save it in an
appropriate development package or as a local object, syntax-check (Ctrl+F2),
activate (Ctrl+F3), and execute (F8). The report displays an in-memory shelf
catalog; it accesses no database tables. This classic `WRITE` report requires
SAP GUI list output and is not an ABAP Cloud console class or standalone script.
