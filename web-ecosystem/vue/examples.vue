<script setup lang="ts">
import { computed, ref } from "vue";

// Vue 3 single-file component: refs keep mutable state reactive.
interface Book {
  id: number;
  title: string;
  read: boolean;
}

const books = ref<Book[]>([
  { id: 1, title: "Web basics", read: true },
  { id: 2, title: "Useful scripts", read: false },
]);
const onlyUnread = ref(false);
const visible = computed(() =>
  books.value.filter((book) => !onlyUnread.value || !book.read)
);
const unreadCount = computed(() =>
  books.value.filter((book) => !book.read).length
);

function reset(): void {
  for (const book of books.value) {
    book.read = false;
  }
}
</script>

<template>
  <section aria-labelledby="reading-title">
    <h1 id="reading-title">Reading list</h1>
    <!-- Templates unwrap refs; v-model connects control and state. -->
    <label>
      <input v-model="onlyUnread" type="checkbox">
      Only unread
    </label>
    <ul v-if="visible.length > 0">
      <li v-for="book in visible" :key="book.id">
        <label>
          <input v-model="book.read" type="checkbox">
          {{ book.title }} {{ book.read ? '(read)' : '(next)' }}
        </label>
      </li>
    </ul>
    <p v-else>All caught up!</p>
    <p aria-live="polite">Unread: {{ unreadCount }}</p>
    <button type="button" @click="reset">Mark all unread</button>
  </section>
</template>

<style scoped>
/* Scoped rules apply to this component's elements. */
section {
  max-width: 36rem;
  font-family: system-ui, sans-serif;
}
li {
  margin-block: 0.5rem;
}
</style>
