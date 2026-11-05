export {};

// Bun runs TypeScript directly; annotations do not validate runtime input.
interface Book {
  title: string;
  read: boolean;
}

const reader: string = Bun.argv[2]?.trim() || "Guest";
const books: Book[] = [
  { title: "Web basics", read: true },
  { title: "Useful scripts", read: false },
];

function label(book: Book): string {
  return `${book.title}: ${book.read ? "read" : "next"}`;
}

console.log(`${reader}'s reading list`);
for (const book of books) {
  if (!book.read) {
    console.log(label(book));
  }
}

// Bun's SQLite module ships with the runtime; :memory: creates no file.
const { Database } = await import("bun:sqlite");
const database = new Database(":memory:");
try {
  database.run("CREATE TABLE books (title TEXT NOT NULL, is_read INTEGER)");
  const insert = database.query("INSERT INTO books VALUES (?, ?)");
  for (const book of books) {
    // Bind values instead of constructing SQL from input text.
    insert.run(book.title, book.read ? 1 : 0);
  }

  const unread = database.query(
    "SELECT title FROM books WHERE is_read = 0 ORDER BY title"
  );
  console.log("Database results:", unread.all());
} finally {
  database.close();
}

// A Set stores distinct values; spread converts it back to an array.
const topics = new Set(["typescript", "sqlite", "typescript"]);
console.log("Topics:", [...topics].join(", "));

// Response uses the standard web API; no HTTP server is started.
const response = Response.json({ reader, books });
if (response.ok) {
  console.log("JSON preview:", await response.text());
}

console.log("Bun version:", Bun.version);
