import { useState } from "react";

// Render this component inside an existing React application's root.
const initialBooks = [
  { id: 1, title: "Web basics", read: true },
  { id: 2, title: "Useful scripts", read: false },
];

function BookRow({ book, onToggle }) {
  return (
    <li>
      <label>
        <input
          type="checkbox"
          checked={book.read}
          onChange={() => onToggle(book.id)}
        />
        {book.title} {book.read ? "(read)" : "(next)"}
      </label>
    </li>
  );
}

export default function Examples() {
  // State setters schedule renders; replace arrays rather than mutating them.
  const [books, setBooks] = useState(initialBooks);
  const [onlyUnread, setOnlyUnread] = useState(false);
  const visible = books.filter((book) => !onlyUnread || !book.read);

  function toggleBook(id) {
    setBooks((current) => current.map((book) =>
      book.id === id ? { ...book, read: !book.read } : book
    ));
  }

  return (
    <section aria-labelledby="reading-title">
      <h1 id="reading-title">Reading list</h1>
      {/* JSX expressions use braces; list keys identify stable records. */}
      <label>
        <input
          type="checkbox"
          checked={onlyUnread}
          onChange={(event) => setOnlyUnread(event.target.checked)}
        />
        Only unread
      </label>
      {visible.length > 0 ? (
        <ul>
          {visible.map((book) => (
            <BookRow key={book.id} book={book} onToggle={toggleBook} />
          ))}
        </ul>
      ) : (
        <p>All caught up!</p>
      )}
      <p aria-live="polite">Unread: {books.filter((book) => !book.read).length}</p>
    </section>
  );
}
