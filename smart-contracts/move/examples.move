// Aptos Move package module; no publishing or account required to test.
module example_addr::examples {
    use std::vector;

    const E_EMPTY: u64 = 1;
    const E_UNAVAILABLE: u64 = 2;

    // Abilities govern whether values can be copied or discarded.
    struct Book has copy, drop, store {
        title: vector<u8>,
        copies: u64,
    }

    fun new_book(title: vector<u8>, copies: u64): Book {
        assert!(!vector::is_empty(&title), E_EMPTY);
        Book { title, copies }
    }

    // Immutable borrows allow inspection without moving ownership.
    fun available(book: &Book): bool {
        book.copies > 0
    }

    // A mutable borrow allows the caller's value to change.
    fun borrow_copy(book: &mut Book) {
        assert!(available(book), E_UNAVAILABLE);
        book.copies = book.copies - 1;
    }

    public fun available_titles(): u64 {
        let books = vector[
            new_book(b"Dune", 3),
            new_book(b"Foundation", 0),
            new_book(b"Cosmos", 2)
        ];
        let count = 0;
        let i = 0;
        while (i < vector::length(&books)) {
            if (available(vector::borrow(&books, i))) {
                count = count + 1;
            };
            i = i + 1;
        };
        count
    }

    #[test]
    fun local_inventory() {
        let book = new_book(b"Dune", 1);
        borrow_copy(&mut book);
        assert!(!available(&book), E_UNAVAILABLE);
        assert!(available_titles() == 2, E_UNAVAILABLE);
        // Destructuring consumes the value; byte vectors have drop.
        let Book { title, copies: _ } = book;
        assert!(title == b"Dune", E_EMPTY);
    }
}
