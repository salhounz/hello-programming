"use strict";

// A tiny reading list: strings, booleans, numbers, arrays, and objects.
const owner = "Ada";
let showFinished = false;
const books = [
  { id: 1, title: "Web basics", finished: true },
  { id: 2, title: "Useful scripts", finished: false },
];

/** Return a display label without changing the book. */
function describe(book) {
  const status = book.finished ? "read" : "next";
  return `${book.title} (${status})`;
}

// Spread makes a new array; its existing objects are still shared.
const expanded = [
  ...books,
  { id: 3, title: "Browser tools", finished: false },
];
const visible = expanded.filter((book) => showFinished || !book.finished);
console.log(`${owner}'s reading list`);
for (const book of visible) {
  console.log(describe(book));
}

// Sets remove duplicates; Maps associate keys with values.
const tags = new Set(["web", "scripts", "web"]);
const byId = new Map(expanded.map((book) => [book.id, book]));
console.log("Tags:", [...tags].join(", "));
console.log("Lookup:", byId.get(2)?.title ?? "No book found");

// Nullish defaults preserve valid false, zero, and empty-string values.
const preferences = { nickname: null, compact: false };
const nickname = preferences.nickname ?? owner;
console.log("Reader:", nickname, "Compact:", preferences.compact);

// Object spread creates an updated record instead of editing the original.
const completed = { ...expanded[1], finished: true };
console.log("Updated:", describe(completed));
console.log("Original:", describe(expanded[1]));

// JSON is text; parsing may fail, so catch errors at the boundary.
try {
  const saved = JSON.stringify(visible);
  const restored = JSON.parse(saved);
  if (Array.isArray(restored)) {
    console.log("Restored books:", restored.length);
  }
} catch (error) {
  console.error("Cannot restore list:", error.message);
}

showFinished = true;
console.log("Show finished next time:", showFinished);
