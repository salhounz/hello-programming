// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// A local learning contract: no payments or external calls.
contract Examples {
    struct Book {
        string title;
        uint256 copies;
    }

    address public immutable librarian;
    Book[] private books;
    mapping(address => bool) public members;
    event Borrowed(address indexed reader, uint256 indexed bookId);

    constructor() {
        librarian = msg.sender;
        books.push(Book("Dune", 3));
        books.push(Book("Cosmos", 2));
    }

    modifier onlyLibrarian() {
        require(msg.sender == librarian, "librarian only");
        _;
    }

    function enroll(address reader) external onlyLibrarian {
        require(reader != address(0), "zero address");
        members[reader] = true;
    }

    function borrow(uint256 bookId) external {
        require(members[msg.sender], "membership required");
        require(bookId < books.length, "unknown book");
        // A storage reference updates persistent contract state.
        Book storage book = books[bookId];
        require(book.copies > 0, "no copies");
        book.copies -= 1;
        emit Borrowed(msg.sender, bookId);
    }

    function summary(uint256 bookId)
        external view returns (string memory title, bool available)
    {
        require(bookId < books.length, "unknown book");
        Book storage book = books[bookId];
        return (book.title, book.copies > 0);
    }

    function availableTitles() external view returns (uint256 count) {
        // This loop is bounded by the two constructor-created books.
        for (uint256 i = 0; i < books.length; i++) {
            if (books[i].copies > 0) {
                count++;
            }
        }
    }
}
