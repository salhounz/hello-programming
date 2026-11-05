"use strict";

const { parseArgs } = require("node:util");
const { Readable } = require("node:stream");
const { setTimeout: delay } = require("node:timers/promises");

// Run with --name Ada; parseArgs rejects unknown options and missing values.
async function main() {
  const { values } = parseArgs({
    options: {
      name: { type: "string", default: "Guest" },
      all: { type: "boolean", default: false },
    },
  });

  const books = [
    { title: "Web basics", read: true },
    { title: "Useful scripts", read: false },
  ];
  const visible = books.filter((book) => values.all || !book.read);
  const reader = values.name.trim() || "Guest";
  console.log(`${reader}'s reading list`);

  function describe(book) {
    return `${book.title}: ${book.read ? "read" : "next"}`;
  }

  // Async iteration consumes a stream one chunk at a time.
  const lines = Readable.from(visible.map(describe));
  for await (const line of lines) {
    console.log(line);
  }

  // Promises let independent waits overlap; they do not create CPU threads.
  async function recommendation(title) {
    await delay(1);
    return title.toUpperCase();
  }
  const suggestions = await Promise.all([
    recommendation("Browser tools"),
    recommendation("Command line tools"),
  ]);
  console.log("Suggestions:", suggestions.join(", "));

  const unique = new Set([...suggestions, suggestions[0]]);
  console.log("Unique suggestions:", unique.size);
  console.log("Runtime:", process.version);
  console.log("Platform:", process.platform);
}

// Set the exit code while allowing pending output to flush.
main().catch((error) => {
  console.error("Usage: node examples.js [--name Ada] [--all]");
  console.error(error.message);
  process.exitCode = 1;
});
