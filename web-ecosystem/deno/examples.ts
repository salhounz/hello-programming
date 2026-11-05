export {};

// No file, network, or environment permissions are needed for this script.
interface Book {
  title: string;
  read: boolean;
}

const reader: string = Deno.args[0]?.trim() || "Guest";
const books: Book[] = [
  { title: "Web basics", read: true },
  { title: "Useful scripts", read: false },
];

function label(book: Book): string {
  if (book.read) {
    return `${book.title} (read)`;
  }
  return `${book.title} (next)`;
}

console.log(`${reader}'s reading list`);
for (const book of books.filter((item) => !item.read)) {
  console.log(label(book));
}

const topics = new Set(["web", "typescript", "web"]);
console.log("Topics:", [...topics].join(", "));

// Web-standard encoders and typed arrays work without an import.
const encoder = new TextEncoder();
const decoder = new TextDecoder();
const bytes: Uint8Array = encoder.encode(reader);
console.log("UTF-8 byte length:", bytes.byteLength);
console.log("Decoded:", decoder.decode(bytes));

// Response is an in-memory web API object here, not a network request.
const response = Response.json({ reader, books });
console.log("Content type:", response.headers.get("content-type"));
console.log("JSON:", await response.text());

async function recommendation(title: string): Promise<string> {
  // A resolved Promise illustrates async return types without doing I/O.
  return title.toUpperCase();
}
const suggestions = await Promise.all([
  recommendation("Browser tools"),
  recommendation("Command line tools"),
]);
console.log("Suggestions:", suggestions.join(", "));

console.log("Deno version:", Deno.version.deno);
console.log("Operating system:", Deno.build.os);
console.log("Architecture:", Deno.build.arch);
