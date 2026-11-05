-- A read-only book report: PostgreSQL or SQLite 3.25+.
-- CTEs name relations for one statement, not mutable variables.
WITH
books(id, title, category, copies, note) AS (
    VALUES
        (1, 'Dune', 'fiction', 3, 'reserved'),
        (2, 'Foundation', 'fiction', 0, NULL),
        (3, 'The Planets', 'science', 2, NULL),
        (4, 'Cosmos', 'science', 5, 'new')
),
-- Explicit casts describe values; NULL represents missing data.
settings AS (
    SELECT CAST(2 AS INTEGER) AS minimum_copies
),
-- CASE is an expression, while WHERE removes rows.
classified AS (
    SELECT
        id,
        title,
        category,
        copies,
        COALESCE(note, 'none') AS note,
        CASE
            WHEN copies = 0 THEN 'unavailable'
            WHEN copies < 3 THEN 'limited'
            ELSE 'available'
        END AS availability
    FROM books
),
-- Aggregate functions summarize each category's collection of rows.
totals AS (
    SELECT
        category,
        COUNT(*) AS title_count,
        SUM(copies) AS total_copies
    FROM books
    GROUP BY category
    HAVING SUM(copies) > 0
)
-- JOIN combines relations without modifying either input.
SELECT
    UPPER(b.title) AS title,
    b.category,
    b.availability,
    b.note,
    t.title_count,
    t.total_copies,
    -- A window function retains individual rows while ranking them.
    ROW_NUMBER() OVER (
        PARTITION BY b.category ORDER BY b.copies DESC, b.id
    ) AS category_rank
FROM classified AS b
JOIN totals AS t ON t.category = b.category
CROSS JOIN settings AS s
WHERE b.copies >= s.minimum_copies
ORDER BY b.category, category_rank;
