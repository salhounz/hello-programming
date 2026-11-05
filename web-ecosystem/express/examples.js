"use strict";

const express = require("express");
const app = express();
const port = 3000;

// In-memory records reset when the process restarts.
const books = [
  { id: 1, title: "Web basics", read: true },
  { id: 2, title: "Useful scripts", read: false },
];

function publicBook(book) {
  return { ...book, status: book.read ? "read" : "next" };
}

// Middleware runs in registration order; keep the demonstration local.
app.use((_request, response, next) => {
  response.set("X-Example", "reading-list");
  next();
});

app.get("/", (_request, response) => {
  response.type("text").send("Try /books, /books?unread=true, or /books/2");
});

app.get("/books", (request, response) => {
  const unreadOnly = request.query.unread === "true";
  const visible = books.filter((book) => !unreadOnly || !book.read);
  response.json({ books: visible.map(publicBook), count: visible.length });
});

app.get("/books/:id", (request, response) => {
  const id = Number(request.params.id);
  if (!Number.isSafeInteger(id) || id < 1) {
    response.status(400).json({ error: "Use a positive integer book ID" });
    return;
  }
  const book = books.find((item) => item.id === id);
  if (!book) {
    response.status(404).json({ error: "Book not found" });
    return;
  }
  response.json(publicBook(book));
});

app.use((_request, response) => {
  response.status(404).json({ error: "Route not found" });
});

// Bind loopback so only this computer can reach the demonstration server.
const server = app.listen(port, "127.0.0.1", () => {
  console.log(`Open http://127.0.0.1:${port}/books`);
});
server.on("error", (error) => {
  console.error(error.message);
  process.exitCode = 1;
});
