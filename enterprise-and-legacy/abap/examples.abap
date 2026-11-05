REPORT zintro_examples.

" Target: classic executable report, ABAP 7.40 or later.
" Types describe a row; an internal table holds many rows.
TYPES: BEGIN OF ty_book,
         title     TYPE string,
         available TYPE abap_bool,
       END OF ty_book.
TYPES ty_books TYPE STANDARD TABLE OF ty_book WITH EMPTY KEY.

" A local class provides a reusable, typed method.
CLASS lcl_shelf DEFINITION FINAL.
  PUBLIC SECTION.
    CLASS-METHODS label
      IMPORTING book TYPE ty_book
      RETURNING VALUE(result) TYPE string.
ENDCLASS.

CLASS lcl_shelf IMPLEMENTATION.
  METHOD label.
    IF book-available = abap_true.
      result = |{ book-title } - on shelf|.
    ELSE.
      result = |{ book-title } - on loan|.
    ENDIF.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  DATA(books) = VALUE ty_books(
    ( title = 'Dune' available = abap_true )
    ( title = 'Emma' available = abap_false )
    ( title = 'Sapiens' available = abap_true ) ).
  DATA available_count TYPE i VALUE 0.

  " INTO copies the row; changing book does not update the table.
  LOOP AT books INTO DATA(book).
    DATA(description) = lcl_shelf=>label( book ).
    WRITE / description.
    IF book-available = abap_true.
      available_count = available_count + 1.
    ENDIF.
  ENDLOOP.
  WRITE / |Available count: { available_count }|.

  " READ TABLE reports success through sy-subrc.
  READ TABLE books INTO book WITH KEY title = 'Dune'.
  IF sy-subrc = 0.
    book-available = abap_false.
    WRITE / |Borrowed copy: { lcl_shelf=>label( book ) }|.
  ELSE.
    WRITE / 'Missing title'.
  ENDIF.

  " This report uses memory only: no database or business-object updates.
  WRITE / |Catalog rows: { lines( books ) }|.
