// App Router Server Component: copy to app/examples/page.tsx.
// No client state or network service is required for this local data.
type Book = {
  id: string;
  title: string;
  read: boolean;
  topics: string[];
};

const books: Book[] = [
  { id: "web", title: "Web basics", read: true, topics: ["html", "css"] },
  { id: "scripts", title: "Useful scripts", read: false, topics: ["js"] },
];

function label(book: Book): string {
  if (book.read) {
    return `${book.title} (read)`;
  }
  return `${book.title} (next)`;
}

// A small component accepts typed props and composes into the page.
function BookCard({ book }: { book: Book }) {
  return (
    <article>
      <h2>{label(book)}</h2>
      <p>Topics: {book.topics.join(", ")}</p>
      <details>
        <summary>Reading suggestion</summary>
        <p>{book.read ? "Share a lesson with a friend." : "Try the first chapter."}</p>
      </details>
    </article>
  );
}

export default function ExamplesPage() {
  const reader: string = "Ada";
  const onlyUnread: boolean = true;
  const visible = books.filter((book) => !onlyUnread || !book.read);
  const topics = new Set(books.flatMap((book) => book.topics));

  return (
    <main>
      <h1>{reader}'s reading list</h1>
      {/* Keys identify siblings. Native details work without client state. */}
      {visible.length > 0 ? (
        <ul>
          {visible.map((book) => (
            <li key={book.id}>
              <BookCard book={book} />
            </li>
          ))}
        </ul>
      ) : (
        <p>All caught up!</p>
      )}
      <p>All topics: {[...topics].join(", ")}</p>
      <p>Edit onlyUnread in the source to include finished books.</p>
    </main>
  );
}
