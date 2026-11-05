# SAS

SAS is used for statistical analysis, reporting, and enterprise data processing.

Official documentation: [SAS documentation](https://documentation.sas.com/)

Run: `sas hello.sas`

## Introductory examples

Keep [hello.sas](./hello.sas) as the minimal greeting. Open [examples.sas](./examples.sas) for a separate, commented introduction:

- Numeric and character variables; date literals and formats; missing values; DATA steps, arrays, user-defined functions, and reporting procedures.
- Small values and visible output you can change while learning; no external data files or additional packages are needed.

Run from this directory:

```sh
sas examples.sas
```

Read the numbered sections in order, then rerun after changing one value or expression. See [SAS PROC FCMP introduction](https://support.sas.com/resources/papers/proceedings18/2403-2018.pdf) for more detail.

The SAS example creates temporary WORK data sets and a WORK function library. Its `CMPLIB` option points to that library for the current session; use a fresh SAS session for this exercise. `PROC FCMP` must be available in your SAS installation.
