-- SQL*Plus/SQLcl client command, not part of the PL/SQL block.
SET SERVEROUTPUT ON

DECLARE
    v_reader CONSTANT VARCHAR2(30) := 'Ada';
    TYPE book_record IS RECORD (
        title VARCHAR2(60),
        copies PLS_INTEGER
    );
    TYPE book_list IS TABLE OF book_record INDEX BY PLS_INTEGER;
    v_books book_list;
    v_index PLS_INTEGER;
    v_available PLS_INTEGER := 0;

    -- A local function returns a typed value without database writes.
    FUNCTION status(p_copies PLS_INTEGER) RETURN VARCHAR2 IS
    BEGIN
        IF p_copies = 0 THEN
            RETURN 'wait';
        ELSE
            RETURN 'borrow';
        END IF;
    END status;

    PROCEDURE describe_book(p_book book_record) IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE(p_book.title || ': ' || status(p_book.copies));
    END describe_book;
BEGIN
    v_books(1).title := 'Dune';
    v_books(1).copies := 3;
    v_books(2).title := 'Foundation';
    v_books(2).copies := 0;
    v_books(4).title := 'Cosmos';
    v_books(4).copies := 5;

    DBMS_OUTPUT.PUT_LINE('Choices for ' || v_reader);
    -- FIRST/NEXT traverse a sparse associative array safely.
    v_index := v_books.FIRST;
    WHILE v_index IS NOT NULL LOOP
        describe_book(v_books(v_index));
        IF v_books(v_index).copies > 0 THEN
            v_available := v_available + 1;
        END IF;
        v_index := v_books.NEXT(v_index);
    END LOOP;

    -- Mutate local data, then show the updated record.
    v_books(1).copies := v_books(1).copies - 1;
    describe_book(v_books(1));
    DBMS_OUTPUT.PUT_LINE('Available titles: ' || v_available);
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('A value exceeded its declared type');
        RAISE;
END;
/
