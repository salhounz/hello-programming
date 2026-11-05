       >>SOURCE FORMAT FREE
identification division.
program-id. examples.

environment division.
configuration section.
repository.
    function all intrinsic.

data division.
working-storage section.
*> PICTURE describes storage; OCCURS declares a fixed-size table.
01 catalog.
   05 book occurs 3 times.
      10 book-title pic x(20).
      10 book-state pic x.
         88 on-shelf value "Y".
         88 on-loan value "N".
01 book-index binary-long.
01 available-count pic 9(2) value zero.
01 count-display pic Z9.
01 status-text pic x(10).

procedure division.
main.
    move "Dune" to book-title(1)
    set on-shelf(1) to true
    move "Emma" to book-title(2)
    set on-loan(2) to true
    move "Sapiens" to book-title(3)
    set on-shelf(3) to true

    display "Neighborhood shelf"
    perform varying book-index from 1 by 1 until book-index > 3
        perform describe-book
        if on-shelf(book-index)
            add 1 to available-count
        end-if
    end-perform

    *> An edited numeric field controls the printed representation.
    move available-count to count-display
    display "Available count: " trim(count-display)
    goback.

*> A paragraph is a reusable procedural block, not a value function.
describe-book.
    evaluate true
        when on-shelf(book-index)
            move "on shelf" to status-text
        when on-loan(book-index)
            move "on loan" to status-text
        when other
            move "unknown" to status-text
    end-evaluate
    display trim(book-title(book-index)) " - " trim(status-text).
