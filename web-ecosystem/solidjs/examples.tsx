import { createMemo, createSignal, For, Show } from "solid-js";

interface Book {
  id: number;
  title: string;
  read: boolean;
}

// Mount through an existing Solid application's entry point.
export default function Examples() {
  const [books, setBooks] = createSignal<Book[]>([
    { id: 1, title: "Web basics", read: true },
    { id: 2, title: "Useful scripts", read: false },
  ]);
  const [onlyUnread, setOnlyUnread] = createSignal(false);
  // Read signals inside reactive computations to track dependencies.
  const visible = createMemo(() =>
    books().filter((book) => !onlyUnread() || !book.read)
  );
  const unreadCount = createMemo(() =>
    books().filter((book) => !book.read).length
  );

  function toggle(id: number): void {
    setBooks((current) => current.map((book) =>
      book.id === id ? { ...book, read: !book.read } : book
    ));
  }

  return (
    <section aria-labelledby="reading-title">
      <h1 id="reading-title">Reading list</h1>
      <label>
        <input
          type="checkbox"
          checked={onlyUnread()}
          onChange={(event) => setOnlyUnread(event.currentTarget.checked)}
        />
        Only unread
      </label>
      {/* Solid's control-flow components preserve reactive reads. */}
      <Show when={visible().length > 0} fallback={<p>All caught up!</p>}>
        <ul>
          <For each={visible()}>{(book) => (
            <li>
              <label>
                <input
                  type="checkbox"
                  checked={book.read}
                  onChange={() => toggle(book.id)}
                />
                {book.title} {book.read ? "(read)" : "(next)"}
              </label>
            </li>
          )}</For>
        </ul>
      </Show>
      <p aria-live="polite">Unread: {unreadCount()}</p>
    </section>
  );
}
