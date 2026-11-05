SET NOCOUNT ON;

--
--    Type Systems & Variables
--
-- DECLARE introduces typed local variables; assignment changes their values.
DECLARE @score int = 10;
SET @score += 5;
DECLARE @language nvarchar(20) = N'T-SQL';

--
--    Control Flow Operations
--
-- IF and WHILE handle procedural control; CASE is a value expression.
DECLARE @result nvarchar(10);
IF @score >= 10 SET @result = N'pass'; ELSE SET @result = N'retry';
DECLARE @index int = 0;
WHILE @index < 3 BEGIN SET @index += 1; END;

--
--    Execution Blocks
--
-- BEGIN/END groups statements but does not create a separate local-variable scope.
BEGIN
    SET @score += 1;
END;

--
--    Code Health & Documentation
--
-- Use -- and block comments to explain query intent, assumptions, and transaction boundaries.
-- A single-line comment.
/* A multi-line
   comment. */

--
--    Built-In Collections
--
-- Table variables hold typed rows; relational queries process their values.
DECLARE @numbers TABLE (value int NOT NULL);
INSERT INTO @numbers (value) VALUES (1), (2), (3);
SELECT SUM(value) AS total FROM @numbers;

--
--    Data Mutability
--
-- SET updates scalar variables; SELECT derives data without changing source rows.
DECLARE @copied int = @score;
SET @copied += 1;

--
--    Access & Encapsulation
--
-- Aliases and projections shape results; database permissions enforce actual access.
SELECT value AS public_value FROM @numbers;

--
--    Design Paradigms & Patterns
--
-- CTEs and set-based operations organize relational transformations.
;WITH doubled AS (SELECT value * 2 AS value FROM @numbers)
SELECT value FROM doubled;

--
--    Memory Management
--
-- SQL Server manages query memory; local variables and table variables have batch/procedure lifetimes.
DECLARE @temporary nvarchar(20) = N'sample';
SET @temporary = NULL;

--
--    Concurrency & Parallelism
--
-- Concurrency comes from sessions and engine plans; a WHILE loop does not start parallel work.
SELECT @@SPID AS session_id;

--
--    Performance Optimization
--
-- Inspect actual plans and workload statistics before adding indexes or hints.
SELECT value FROM @numbers WHERE value > 1 ORDER BY value;

PRINT 'Hello, World!';
