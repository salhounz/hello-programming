# pragma version ^0.4.1
# A bounded local library: compile and explore on a local EVM only.

struct Book:
    title: String[40]
    copies: uint256

MAX_BOOKS: constant(uint256) = 4
books: DynArray[Book, 4]
librarian: public(address)

@deploy
def __init__():
    self.librarian = msg.sender
    self.books.append(Book(title="Dune", copies=3))
    self.books.append(Book(title="Cosmos", copies=2))

@internal
@pure
def _available(copies: uint256) -> bool:
    return copies > 0

@external
def add_book(title: String[40], copies: uint256):
    assert msg.sender == self.librarian, "librarian only"
    assert len(title) > 0, "empty title"
    assert len(self.books) < MAX_BOOKS, "shelf full"
    self.books.append(Book(title=title, copies=copies))

@external
def borrow(book_id: uint256):
    # Anyone may borrow in this learning model; there are no payments.
    assert book_id < len(self.books), "unknown book"
    assert self._available(self.books[book_id].copies), "no copies"
    self.books[book_id].copies -= 1

@external
@view
def summary(book_id: uint256) -> (String[40], bool):
    assert book_id < len(self.books), "unknown book"
    book: Book = self.books[book_id]
    return book.title, self._available(book.copies)

@external
@view
def available_titles() -> uint256:
    count: uint256 = 0
    # A literal upper bound makes the maximum work explicit.
    for i: uint256 in range(MAX_BOOKS):
        if i >= len(self.books):
            break
        if self._available(self.books[i].copies):
            count += 1
    return count

# Storage uses self; local variables need explicit type declarations.
# External functions form the ABI; _available stays internal.
