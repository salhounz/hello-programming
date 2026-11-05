export {};

// Types describe records; readonly prevents writes through this type.
interface Note {
  readonly id: number;
  title: string;
  status: "draft" | "published";
  tags: string[];
}

const notes: Note[] = [
  { id: 1, title: "Getting started", status: "published", tags: ["web"] },
  { id: 2, title: "Next steps", status: "draft", tags: ["web", "tools"] },
];
let includeDrafts: boolean = false;

/** A union makes the allowed status values explicit. */
function label(note: Note): string {
  if (note.status === "draft") {
    return `[Draft] ${note.title}`;
  }
  return note.title;
}

const visible = notes.filter((note) => includeDrafts || note.status === "published");
for (const note of visible) {
  console.log(label(note));
}

// Generics keep the element type when looking up an optional first value.
function first<T>(items: readonly T[]): T | undefined {
  return items[0];
}
const selected = first(notes);
if (selected !== undefined) {
  console.log("Selected:", selected.title);
}

const byId = new Map<number, Note>(notes.map((note) => [note.id, note]));
console.log("Missing:", byId.get(99)?.title ?? "Not found");
const tags = new Set(notes.flatMap((note) => note.tags));
console.log("Tags:", [...tags].join(", "));

// unknown forces inspection; a type assertion would not validate input.
function readTitle(value: unknown): string {
  if (typeof value === "string" && value.trim() !== "") {
    return value.trim();
  }
  return "Untitled";
}
const incoming: unknown = "  A new note  ";
console.log(readTitle(incoming));

const published: Note = { ...notes[1], status: "published" };
console.log(label(published));
includeDrafts = true;
console.log("Include drafts:", includeDrafts);
