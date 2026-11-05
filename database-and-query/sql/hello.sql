--
--    Type Systems & Variables
--
-- Literals and CAST express types; ordinary SQL has no portable imperative variable declaration.
SELECT CAST(10 AS INTEGER) AS score, CAST('Ada' AS VARCHAR(20)) AS name;

--
--    Control Flow Operations
--
-- CASE selects a result and WHERE filters rows instead of iterating imperatively.
SELECT CASE WHEN 15 >= 10 THEN 'pass' ELSE 'retry' END AS result;

--
--    Execution Blocks
--
-- A CTE names a query expression within a statement; it is not a stored procedure.
WITH numbers AS (SELECT 1 AS value UNION ALL SELECT 2)
SELECT value FROM numbers;

--
--    Code Health & Documentation
--
-- Use -- line comments and /* */ block comments; document assumptions about data and dialect.
-- A single-line comment.
/* A multi-line comment.
   This script uses literal sample data. */
SELECT 'documented query' AS note;

--
--    Built-In Collections
--
-- Relations hold rows and columns; UNION ALL combines row sets while preserving duplicates.
SELECT 1 AS value UNION ALL SELECT 2 UNION ALL SELECT 2;

--
--    Data Mutability
--
-- SELECT derives a result without changing the source; UPDATE is a separate data-modification operation.
WITH sample AS (SELECT 10 AS score)
SELECT score, score + 1 AS updated_score FROM sample;

--
--    Access & Encapsulation
--
-- Projection controls returned columns; real access control uses database roles and grants.
WITH account AS (SELECT 'Ada' AS name, 42 AS private_code)
SELECT name FROM account;

--
--    Design Paradigms & Patterns
--
-- Relational composition uses projection, selection, grouping, and joins.
WITH numbers AS (SELECT 1 AS value UNION ALL SELECT 2 UNION ALL SELECT 3)
SELECT SUM(value) AS total FROM numbers;

--
--    Memory Management
--
-- The database owns query memory; CTE scope does not promise materialization or deallocation timing.
WITH temporary_values AS (SELECT 42 AS value)
SELECT value FROM temporary_values;

--
--    Concurrency & Parallelism
--
-- Database sessions can run concurrently; transaction isolation and parallel plans are engine concerns.
SELECT CURRENT_TIMESTAMP AS observed_at;
-- This read-only example opens no transaction or background job.

--
--    Performance Optimization
--
-- Request only needed data, filter deliberately, and inspect real query plans.
WITH numbers AS (SELECT 1 AS value UNION ALL SELECT 2 UNION ALL SELECT 3)
SELECT value FROM numbers WHERE value > 1 ORDER BY value;

SELECT 'Hello, World!' AS message;
