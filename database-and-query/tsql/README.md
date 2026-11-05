# Transact-SQL

Transact-SQL extends SQL for Microsoft SQL Server and Azure SQL.

## Table of Contents

- [Understanding the Ecosystem](#understanding-the-ecosystem)
- [Executing Transact-SQL](#executing-transact-sql)
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
| Transact-SQL | SQL Server's SQL dialect, including typed variables, procedural statements, and table expressions. | [Transact-SQL documentation](https://learn.microsoft.com/sql/t-sql/language-reference/) |
| SQL Server / Azure SQL | The host engine provides storage, query execution, and transaction isolation. | [Reference](https://learn.microsoft.com/sql/t-sql/language-reference/) |
| T-SQL batch | A sequence of statements executed by the server. | [Reference](https://learn.microsoft.com/sql/t-sql/language-reference/) |

## Executing Transact-SQL

### In this repository

Use: Execute `hello.sql` in SQL Server Management Studio or `sqlcmd`.

Use a SQL Server or Azure SQL database session. This script only changes local variables and table-variable data.

Open [hello.sql](./hello.sql) for the 11 annotated topic sections. The examples use small, local values. Some results are retained in variables rather than printed; inspect them with the debugger or output operation for this language.

Use a toolchain that matches the language version and platform described by the provider. Compiler-generated executables may need a different launch command on Windows.

## Example Learning Path

This is a suggested practice order, independent of any provider's certification requirements.

| Stage | Focus | Practice milestone |
| --- | --- | --- |
| 1. Foundations | DECLARE introduces typed local variables; assignment changes their values. | Change a value and predict its type and result. |
| 2. Decisions and execution | IF and WHILE handle procedural control; CASE is a value expression. BEGIN/END groups statements but does not create a separate local-variable scope. | Exercise both outcomes of a small example. |
| 3. Data and updates | Table variables hold typed rows; relational queries process their values. SET updates scalar variables; SELECT derives data without changing source rows. | Handle empty, single-item, and repeated input. |
| 4. Organization | Aliases and projections shape results; database permissions enforce actual access. CTEs and set-based operations organize relational transformations. | Separate one responsibility into a named component. |
| 5. Reliability | Use -- and block comments to explain query intent, assumptions, and transaction boundaries. SQL Server manages query memory; local variables and table variables have batch/procedure lifetimes. | Check an edge case and explain resource lifetime. |
| 6. Execution model | Concurrency comes from sessions and engine plans; a WHILE loop does not start parallel work. | Explain what can run independently and what must wait. |
| 7. Applied practice | Inspect actual plans and workload statistics before adding indexes or hints. | Finish a project below and measure before optimizing. |

## Quick Reference

| Topic | Example / reminder | Helpful detail |
| --- | --- | --- |
| Type Systems & Variables | `DECLARE @score int = 10;` | DECLARE introduces typed local variables; assignment changes their values. |
| Control Flow Operations | `IF @score >= 10 ... ELSE ...` | IF and WHILE handle procedural control; CASE is a value expression. |
| Execution Blocks | `BEGIN ... END` | BEGIN/END groups statements but does not create a separate local-variable scope. |
| Code Health & Documentation | `-- comment; /* block comment */` | Use -- and block comments to explain query intent, assumptions, and transaction boundaries. |
| Built-In Collections | `DECLARE @numbers TABLE (value int);` | Table variables hold typed rows; relational queries process their values. |
| Data Mutability | `SET @copied += 1;` | SET updates scalar variables; SELECT derives data without changing source rows. |
| Access & Encapsulation | `SELECT value AS public_value FROM @numbers;` | Aliases and projections shape results; database permissions enforce actual access. |
| Design Paradigms & Patterns | `;WITH doubled AS (...) SELECT ...` | CTEs and set-based operations organize relational transformations. |
| Memory Management | `SET @temporary = NULL;` | SQL Server manages query memory; local variables and table variables have batch/procedure lifetimes. |
| Concurrency & Parallelism | `SELECT @@SPID AS session_id;` | Concurrency comes from sessions and engine plans; a WHILE loop does not start parallel work. |
| Performance Optimization | `WHERE value > 1 ORDER BY value` | Inspect actual plans and workload statistics before adding indexes or hints. |

The code above is a compact reminder; use [hello.sql](./hello.sql) for the declarations, imports, and surrounding context.

## Available Learning Resources

| Resource | Best for | Format and access |
| --- | --- | --- |
| [Transact-SQL documentation](https://learn.microsoft.com/sql/t-sql/language-reference/) | Language and platform reference. | Provider documentation; follow the topics used in the local example. |
| [Microsoft SQL documentation](https://learn.microsoft.com/sql/) | Study engine behavior, T-SQL, and administration. | Tutorials and examples; check the provider for access terms. |

Choose one main learning route and reproduce its examples before adding more resources.

## Available Certificates & Certifications

The table distinguishes language assessments, course-completion certificates, and related platform credentials. A platform credential can involve this language without being a language-only certification.

| Provider and credential | Level / scope | Assessment or completion requirement | Cost model |
| --- | --- | --- | --- |
| [Azure Database Administrator Associate](https://learn.microsoft.com/credentials/certifications/azure-database-administrator-associate/) | SQL Server/Azure SQL administration; related platform credential | Pass the current required exam and follow renewal rules. | Exam pricing varies by region; provider preparation materials are available. |

Provider links were reviewed on **October 30, 2026**. Follow them for current versions, prerequisites, assessment rules, availability, and pricing.

## Helpful Developer Tools

| Tool | Purpose | When to use it |
| --- | --- | --- |
| [SQL Server Management Studio](https://learn.microsoft.com/sql/ssms/) | Author queries and inspect plans. | When developing and checking examples for this language. |
| [sqlcmd](https://learn.microsoft.com/sql/tools/sqlcmd/sqlcmd-utility) | Execute scripts from a command line. | When developing and checking examples for this language. |

## Simple Project Examples

| Project | Skills to practice | A useful definition of done |
| --- | --- | --- |
| Inventory report | Filtering, grouping, aggregation | Explain results for empty inputs and repeated values. |
| Public data projection | Field selection and access boundaries | Return only intended fields and document required privileges. |
| Query performance comparison | Plans, limits, selectivity | Compare actual plans or timings on representative data. |

## Simple Mistakes To Avoid

- NULL requires IS NULL; = NULL does not test for absence.
- Use parameters rather than concatenating untrusted SQL text.
- Rows have no guaranteed order without ORDER BY.
- A local table variable is not automatically the best plan choice for every workload.

## Concise introduction

[examples.sql](./examples.sql) covers Unicode strings, scalar and table variables,
IF/ELSE, CASE, CTEs, window ranking, aggregates, local UPDATE, WHILE, and built-in
functions. Only batch-local values change; no permanent objects are created.

From this directory, use an existing SQL Server connection:
`sqlcmd -S localhost -d tempdb -E -b -i examples.sql`. This uses Windows integrated
authentication; substitute your server and existing authentication options as
needed. Or open the file in SSMS and execute the entire batch. Expect two ranked
choices, totals, a countdown, and uppercase title labels.
