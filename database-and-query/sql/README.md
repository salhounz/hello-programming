# SQL

SQL defines and queries data in relational database systems. The examples use core SQL expressions and CTEs, with PostgreSQL as a concrete execution target.

## Table of Contents

- [Understanding the Ecosystem](#understanding-the-ecosystem)
- [Executing SQL](#executing-sql)
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
| SQL | Declarative relational queries; database engines choose execution plans for requested results. | [PostgreSQL SQL tutorial](https://www.postgresql.org/docs/current/tutorial-sql.html) |
| Database engine | Parses queries, checks types, plans access, and executes operations. | [Reference](https://www.postgresql.org/docs/current/tutorial-sql.html) |
| Dialect | Vendors extend the common SQL core differently. | [Reference](https://www.postgresql.org/docs/current/tutorial-sql.html) |

## Executing SQL

### In this repository

Use: Execute `hello.sql` in a PostgreSQL database client.

The statements use literal data and do not create or modify application tables. Other SQL implementations may need syntax adjustments.

Open [hello.sql](./hello.sql) for the 11 annotated topic sections. The examples use small, local values. Some results are retained in variables rather than printed; inspect them with the debugger or output operation for this language.

Use a toolchain that matches the language version and platform described by the provider. Compiler-generated executables may need a different launch command on Windows.

## Example Learning Path

This is a suggested practice order, independent of any provider's certification requirements.

| Stage | Focus | Practice milestone |
| --- | --- | --- |
| 1. Foundations | Literals and CAST express types; ordinary SQL has no portable imperative variable declaration. | Change a value and predict its type and result. |
| 2. Decisions and execution | CASE selects a result and WHERE filters rows instead of iterating imperatively. A CTE names a query expression within a statement; it is not a stored procedure. | Exercise both outcomes of a small example. |
| 3. Data and updates | Relations hold rows and columns; UNION ALL combines row sets while preserving duplicates. SELECT derives a result without changing the source; UPDATE is a separate data-modification operation. | Handle empty, single-item, and repeated input. |
| 4. Organization | Projection controls returned columns; real access control uses database roles and grants. Relational composition uses projection, selection, grouping, and joins. | Separate one responsibility into a named component. |
| 5. Reliability | Use -- line comments and /* */ block comments; document assumptions about data and dialect. The database owns query memory; CTE scope does not promise materialization or deallocation timing. | Check an edge case and explain resource lifetime. |
| 6. Execution model | Database sessions can run concurrently; transaction isolation and parallel plans are engine concerns. | Explain what can run independently and what must wait. |
| 7. Applied practice | Request only needed data, filter deliberately, and inspect real query plans. | Finish a project below and measure before optimizing. |

## Quick Reference

| Topic | Example / reminder | Helpful detail |
| --- | --- | --- |
| Type Systems & Variables | `CAST(10 AS INTEGER)` | Literals and CAST express types; ordinary SQL has no portable imperative variable declaration. |
| Control Flow Operations | `CASE WHEN score >= 10 THEN 'pass' ELSE 'retry' END` | CASE selects a result and WHERE filters rows instead of iterating imperatively. |
| Execution Blocks | `WITH numbers AS (...) SELECT value FROM numbers` | A CTE names a query expression within a statement; it is not a stored procedure. |
| Code Health & Documentation | `-- comment; /* block comment */` | Use -- line comments and /* */ block comments; document assumptions about data and dialect. |
| Built-In Collections | `SELECT 1 AS value UNION ALL SELECT 2` | Relations hold rows and columns; UNION ALL combines row sets while preserving duplicates. |
| Data Mutability | `SELECT score, score + 1 AS updated_score` | SELECT derives a result without changing the source; UPDATE is a separate data-modification operation. |
| Access & Encapsulation | `SELECT name FROM account` | Projection controls returned columns; real access control uses database roles and grants. |
| Design Paradigms & Patterns | `SELECT SUM(value) AS total FROM numbers` | Relational composition uses projection, selection, grouping, and joins. |
| Memory Management | `WITH temporary_values AS (...)` | The database owns query memory; CTE scope does not promise materialization or deallocation timing. |
| Concurrency & Parallelism | `SELECT CURRENT_TIMESTAMP` | Database sessions can run concurrently; transaction isolation and parallel plans are engine concerns. |
| Performance Optimization | `WHERE value > 1 ORDER BY value` | Request only needed data, filter deliberately, and inspect real query plans. |

The code above is a compact reminder; use [hello.sql](./hello.sql) for the declarations, imports, and surrounding context.

## Available Learning Resources

| Resource | Best for | Format and access |
| --- | --- | --- |
| [PostgreSQL SQL tutorial](https://www.postgresql.org/docs/current/tutorial-sql.html) | Language and platform reference. | Provider documentation; follow the topics used in the local example. |
| [PostgreSQL documentation](https://www.postgresql.org/docs/current/) | Look up expressions, transactions, and query plans. | Tutorials and examples; check the provider for access terms. |

Choose one main learning route and reproduce its examples before adding more resources.

## Available Certificates & Certifications

This guide does not list a verified standalone SQL certification. Use the learning resources above and the projects below to demonstrate practical skills; documentation study and a project portfolio are not certificates.

Provider links were reviewed on **October 30, 2026**. Follow them for current versions, prerequisites, assessment rules, availability, and pricing.

## Helpful Developer Tools

| Tool | Purpose | When to use it |
| --- | --- | --- |
| [psql](https://www.postgresql.org/docs/current/app-psql.html) | Execute SQL and inspect results. | When developing and checking examples for this language. |
| [EXPLAIN](https://www.postgresql.org/docs/current/using-explain.html) | Inspect plans before attempting performance changes. | When developing and checking examples for this language. |

## Simple Project Examples

| Project | Skills to practice | A useful definition of done |
| --- | --- | --- |
| Inventory report | Filtering, grouping, aggregation | Explain results for empty inputs and repeated values. |
| Public data projection | Field selection and access boundaries | Return only intended fields and document required privileges. |
| Query performance comparison | Plans, limits, selectivity | Compare actual plans or timings on representative data. |

## Simple Mistakes To Avoid

- SQL NULL uses three-valued logic; test with IS NULL rather than = NULL.
- Row order is not guaranteed without ORDER BY.
- CTEs and views do not automatically enforce authorization.
- Parameterize external inputs using your database client's binding API.

## Concise introduction

[examples.sql](./examples.sql) introduces typed literals, NULL, CTEs, CASE,
filtering, joins, aggregates, built-in functions, and window ranking in a book
report. It reads inline data only and returns three available titles.

From this directory, run `psql -X -v ON_ERROR_STOP=1 -d postgres -f examples.sql`
against an existing local PostgreSQL server (substitute your database and normal
connection options). Alternatively, SQLite 3.25+ can execute the same file:
`sqlite3 :memory: ".read examples.sql"`. No tables are created.
