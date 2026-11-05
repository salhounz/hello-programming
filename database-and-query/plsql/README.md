# PL/SQL

PL/SQL adds procedural programming to Oracle Database SQL.

## Table of Contents

- [Understanding the Ecosystem](#understanding-the-ecosystem)
- [Executing PL/SQL](#executing-plsql)
- [Example Learning Path](#example-learning-path)
- [Quick Reference](#quick-reference)
- [Available Learning Resources](#available-learning-resources)
- [Available Certificates & Certifications](#available-certificates--certifications)
- [Helpful Developer Tools](#helpful-developer-tools)
- [Simple Project Examples](#simple-project-examples)
- [Simple Mistakes To Avoid](#simple-mistakes-to-avoid)

## Understanding the Ecosystem

| Term | What it means | Where to learn more |
| --- | --- | --- |
| PL/SQL | Oracle's typed procedural extension to SQL, with blocks, exceptions, packages, and collections. | [Oracle Database documentation](https://docs.oracle.com/en/database/oracle/oracle-database/) |
| Oracle Database | Executes SQL and PL/SQL on the server. | [Reference](https://docs.oracle.com/en/database/oracle/oracle-database/) |
| Packages | Group related types, subprograms, and package state. | [Reference](https://docs.oracle.com/en/database/oracle/oracle-database/) |

## Executing PL/SQL

### In this repository

Use: Enable server output and execute `hello.sql` in an Oracle SQL client.

Enable server output in an Oracle client. The trailing slash is a script delimiter used by clients such as SQL*Plus, rather than part of PL/SQL syntax.

Open [hello.sql](./hello.sql) for the 11 annotated topic sections. The examples use small, local values. Some results are retained in variables rather than printed; inspect them with the debugger or output operation for this language.

Use a toolchain that matches the language version and platform described by the provider. Compiler-generated executables may need a different launch command on Windows.

## Example Learning Path

This is a suggested practice order, independent of any provider's certification requirements.

| Stage | Focus | Practice milestone |
| --- | --- | --- |
| 1. Foundations | Variables are typed and declared before BEGIN; CONSTANT prevents reassignment. | Change a value and predict its type and result. |
| 2. Decisions and execution | IF and numeric FOR loops handle procedural decisions and repetition. Anonymous blocks and local subprograms group reusable behavior. | Exercise both outcomes of a small example. |
| 3. Data and updates | Associative arrays, nested tables, and varrays model typed collections. Assignment updates local state; SQL updates stored data through separate statements. | Handle empty, single-item, and repeated input. |
| 4. Organization | Nested declarations hide local state; package specifications expose selected APIs. Use procedures for operations and functions for reusable computed values. | Separate one responsibility into a named component. |
| 5. Reliability | Use -- comments and /* */ block comments; explain data and exception contracts. The database manages local variable memory; releasing a value is not manual heap deallocation. | Check an edge case and explain resource lifetime. |
| 6. Execution model | An ordinary block runs sequentially; multiple sessions and server facilities provide concurrency. | Explain what can run independently and what must wait. |
| 7. Applied practice | Prefer suitable set-based SQL for bulk operations rather than unnecessary row-by-row loops. | Finish a project below and measure before optimizing. |

## Quick Reference

| Topic | Example / reminder | Helpful detail |
| --- | --- | --- |
| Type Systems & Variables | `v_limit CONSTANT PLS_INTEGER := 20;` | Variables are typed and declared before BEGIN; CONSTANT prevents reassignment. |
| Control Flow Operations | `FOR idx IN 1..3 LOOP ... END LOOP;` | IF and numeric FOR loops handle procedural decisions and repetition. |
| Execution Blocks | `FUNCTION add_numbers(...) RETURN PLS_INTEGER` | Anonymous blocks and local subprograms group reusable behavior. |
| Code Health & Documentation | `-- comment; /* block comment */` | Use -- comments and /* */ block comments; explain data and exception contracts. |
| Built-In Collections | `TYPE number_list IS TABLE OF PLS_INTEGER INDEX BY PLS_INTEGER;` | Associative arrays, nested tables, and varrays model typed collections. |
| Data Mutability | `v_copied := v_copied + 1;` | Assignment updates local state; SQL updates stored data through separate statements. |
| Access & Encapsulation | `PROCEDURE increment_value IS ...` | Nested declarations hide local state; package specifications expose selected APIs. |
| Design Paradigms & Patterns | `FUNCTION square_value(value PLS_INTEGER) RETURN PLS_INTEGER` | Use procedures for operations and functions for reusable computed values. |
| Memory Management | `v_temporary := NULL;` | The database manages local variable memory; releasing a value is not manual heap deallocation. |
| Concurrency & Parallelism | `Sequential block; session concurrency belongs to Oracle` | An ordinary block runs sequentially; multiple sessions and server facilities provide concurrency. |
| Performance Optimization | `SELECT SUM(value) INTO v_total FROM ...` | Prefer suitable set-based SQL for bulk operations rather than unnecessary row-by-row loops. |

The code above is a compact reminder; use [hello.sql](./hello.sql) for the declarations, imports, and surrounding context.

## Available Learning Resources

| Resource | Best for | Format and access |
| --- | --- | --- |
| [Oracle Database documentation](https://docs.oracle.com/en/database/oracle/oracle-database/) | Language and platform reference. | Provider documentation; follow the topics used in the local example. |
| [Oracle PL/SQL reference](https://docs.oracle.com/en/database/oracle/oracle-database/23/lnpls/) | Study block structure, exceptions, types, and procedures. | Tutorials and examples; check the provider for access terms. |

Choose one main learning route and reproduce its examples before adding more resources.

## Available Certificates & Certifications

This guide does not list a verified standalone PL/SQL certification. Use the learning resources above and the projects below to demonstrate practical skills; documentation study and a project portfolio are not certificates.

Provider links were reviewed on **October 30, 2026**. Follow them for current versions, prerequisites, assessment rules, availability, and pricing.

## Helpful Developer Tools

| Tool | Purpose | When to use it |
| --- | --- | --- |
| [Oracle SQL Developer](https://www.oracle.com/database/sqldeveloper/) | Edit and debug database programs. | When developing and checking examples for this language. |
| [SQL*Plus](https://docs.oracle.com/en/database/oracle/oracle-database/) | Run scripts and configure DBMS_OUTPUT display. | When developing and checking examples for this language. |

## Simple Project Examples

| Project | Skills to practice | A useful definition of done |
| --- | --- | --- |
| Inventory report | Filtering, grouping, aggregation | Explain results for empty inputs and repeated values. |
| Public data projection | Field selection and access boundaries | Return only intended fields and document required privileges. |
| Query performance comparison | Plans, limits, selectivity | Compare actual plans or timings on representative data. |

## Simple Mistakes To Avoid

- Use := for assignment and = for comparisons.
- SELECT INTO must return the expected row count or raise an exception.
- Handle exceptions deliberately instead of silently swallowing WHEN OTHERS.
- Client script delimiters and database language syntax are separate concerns.

## Concise introduction

[examples.sql](./examples.sql) demonstrates constants, records, a sparse
associative array, local functions and procedures, IF, WHILE, assignment,
DBMS_OUTPUT, and an exception handler that re-raises its error.

In an already connected Oracle SQL*Plus or SQLcl session, change to this directory
before launching the client and enter `@examples.sql`. The script enables server
output and includes the required `/` client delimiter. In SQL Developer use
**Run Script (F5)** with DBMS Output enabled. Expect three book statuses, an
updated Dune status, and `Available titles: 2`. No stored objects are changed.
