DECLARE
    v_score PLS_INTEGER := 10;
BEGIN

    --
    --    Type Systems & Variables
    --
    -- Variables are typed and declared before BEGIN; CONSTANT prevents reassignment.
    DECLARE
        v_limit CONSTANT PLS_INTEGER := 20;
    BEGIN
        v_score := v_score + 5;
        IF v_score > v_limit THEN v_score := v_limit; END IF;
    END;

    --
    --    Control Flow Operations
    --
    -- IF and numeric FOR loops handle procedural decisions and repetition.
    IF v_score >= 10 THEN
        v_score := v_score + 1;
    END IF;
    FOR idx IN 1..3 LOOP
        v_score := v_score + idx;
    END LOOP;

    --
    --    Execution Blocks
    --
    -- Anonymous blocks and local subprograms group reusable behavior.
    DECLARE
        FUNCTION add_numbers(left_value PLS_INTEGER, right_value PLS_INTEGER) RETURN PLS_INTEGER IS
        BEGIN RETURN left_value + right_value; END;
        v_sum PLS_INTEGER;
    BEGIN
        v_sum := add_numbers(2, 3);
    END;

    --
    --    Code Health & Documentation
    --
    -- Use -- comments and /* */ block comments; explain data and exception contracts.
    -- A single-line comment.
    /* A multi-line
       comment. */
    NULL;

    --
    --    Built-In Collections
    --
    -- Associative arrays, nested tables, and varrays model typed collections.
    DECLARE
        TYPE number_list IS TABLE OF PLS_INTEGER INDEX BY PLS_INTEGER;
        v_values number_list;
    BEGIN
        v_values(1) := 10;
        v_values(2) := 20;
    END;

    --
    --    Data Mutability
    --
    -- Assignment updates local state; SQL updates stored data through separate statements.
    DECLARE
        v_copied PLS_INTEGER := v_score;
    BEGIN
        v_copied := v_copied + 1;
    END;

    --
    --    Access & Encapsulation
    --
    -- Nested declarations hide local state; package specifications expose selected APIs.
    DECLARE
        v_private PLS_INTEGER := 0;
        PROCEDURE increment_value IS
        BEGIN v_private := v_private + 1; END;
    BEGIN
        increment_value;
    END;

    --
    --    Design Paradigms & Patterns
    --
    -- Use procedures for operations and functions for reusable computed values.
    DECLARE
        FUNCTION square_value(value PLS_INTEGER) RETURN PLS_INTEGER IS
        BEGIN RETURN value * value; END;
        v_squared PLS_INTEGER;
    BEGIN
        v_squared := square_value(3);
    END;

    --
    --    Memory Management
    --
    -- The database manages local variable memory; releasing a value is not manual heap deallocation.
    DECLARE
        v_temporary VARCHAR2(20) := 'sample';
    BEGIN
        v_temporary := NULL;
    END;

    --
    --    Concurrency & Parallelism
    --
    -- An ordinary block runs sequentially; multiple sessions and server facilities provide concurrency.
    NULL;
    -- This example starts no job and changes no transaction boundary.

    --
    --    Performance Optimization
    --
    -- Prefer suitable set-based SQL for bulk operations rather than unnecessary row-by-row loops.
    DECLARE
        v_total NUMBER;
    BEGIN
        SELECT SUM(value) INTO v_total FROM (
            SELECT 1 AS value FROM dual UNION ALL SELECT 2 FROM dual
        );
    END;

    DBMS_OUTPUT.PUT_LINE('Hello, World!');
END;
/
