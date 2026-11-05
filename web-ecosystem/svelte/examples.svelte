<script lang="ts">
  // Svelte 5 runes track state and derived values in this component.
  interface Book {
    id: number;
    title: string;
    read: boolean;
  }

  let books = $state<Book[]>([
    { id: 1, title: "Web basics", read: true },
    { id: 2, title: "Useful scripts", read: false },
  ]);
  let onlyUnread = $state(false);
  let visible = $derived(books.filter((book) => !onlyUnread || !book.read));
  let unreadCount = $derived(books.filter((book) => !book.read).length);

  function reset(): void {
    for (const book of books) {
      book.read = false;
    }
  }
</script>

<section aria-labelledby="reading-title">
  <h1 id="reading-title">Reading list</h1>
  <!-- bind:checked updates the reactive value when the control changes. -->
  <label>
    <input type="checkbox" bind:checked={onlyUnread}>
    Only unread
  </label>
  {#if visible.length > 0}
    <ul>
      {#each visible as book (book.id)}
        <li>
          <label>
            <input type="checkbox" bind:checked={book.read}>
            {book.title} {book.read ? '(read)' : '(next)'}
          </label>
        </li>
      {/each}
    </ul>
  {:else}
    <p>All caught up!</p>
  {/if}
  <p aria-live="polite">Unread: {unreadCount}</p>
  <button type="button" onclick={reset}>Mark all unread</button>
</section>

<style>
  /* Component styles are scoped by the Svelte compiler. */
  section {
    max-width: 36rem;
    font-family: system-ui, sans-serif;
  }

  li {
    margin-block: 0.5rem;
  }
</style>
