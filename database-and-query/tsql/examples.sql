-- SQL Server: a batch-local reading queue, with no permanent tables.
SET NOCOUNT ON;

DECLARE @reader nvarchar(30) = N'Ada';
DECLARE @minimum int = 2;
DECLARE @include_empty bit = 0;
DECLARE @books TABLE (
    id int PRIMARY KEY,
    title nvarchar(60) NOT NULL,
    copies int NOT NULL,
    note nvarchar(30) NULL
);

INSERT INTO @books (id, title, copies, note)
VALUES (1, N'Dune', 3, N'reserved'),
       (2, N'Foundation', 0, NULL),
       (3, N'Cosmos', 5, N'new');

-- IF controls statements; CASE chooses a value inside a query.
IF EXISTS (SELECT 1 FROM @books WHERE copies >= @minimum)
BEGIN
    PRINT CONCAT(N'Reading choices for ', @reader);
END
ELSE
BEGIN
    PRINT N'No matching books';
END;

;WITH choices AS (
    SELECT id, title, copies, COALESCE(note, N'none') AS note
    FROM @books
    WHERE copies >= @minimum OR @include_empty = 1
)
SELECT title,
       CASE WHEN copies = 0 THEN N'wait' ELSE N'borrow' END AS action,
       note,
       ROW_NUMBER() OVER (ORDER BY copies DESC, id) AS priority
FROM choices
ORDER BY priority;

-- Aggregation is usually clearer than a procedural counting loop.
SELECT COUNT(*) AS title_count, SUM(copies) AS total_copies
FROM @books;

-- Local mutation models borrowing without touching stored data.
UPDATE @books SET copies = copies - 1 WHERE id = 1 AND copies > 0;

DECLARE @remaining int = (SELECT copies FROM @books WHERE id = 1);
WHILE @remaining > 0
BEGIN
    PRINT CONCAT(N'Local copies remaining: ', @remaining);
    SET @remaining -= 1;
END;

-- No CREATE FUNCTION: built-ins provide reusable operations here.
SELECT UPPER(title) AS label, LEN(title) AS characters
FROM @books
ORDER BY id;
