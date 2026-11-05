import { Component } from "@angular/core";

interface Book {
  id: number;
  title: string;
  read: boolean;
}

// Angular 17+ standalone component; built-in control flow needs no CommonModule.
@Component({
  selector: "app-examples",
  standalone: true,
  template: `
    <section aria-labelledby="reading-title">
      <h1 id="reading-title">Reading list</h1>
      <label>
        <input
          type="checkbox"
          [checked]="onlyUnread"
          (change)="toggleFilter()"
        >
        Only unread
      </label>
      <ul>
        @for (book of visible; track book.id) {
          <li>
            <label>
              <input
                type="checkbox"
                [checked]="book.read"
                (change)="toggleBook(book.id)"
              >
              {{ book.title }} {{ book.read ? '(read)' : '(next)' }}
            </label>
          </li>
        } @empty {
          <li>All caught up!</li>
        }
      </ul>
    </section>
  `,
})
export class ExamplesComponent {
  onlyUnread = false;
  books: Book[] = [
    { id: 1, title: "Web basics", read: true },
    { id: 2, title: "Useful scripts", read: false },
  ];

  get visible(): Book[] {
    return this.books.filter((book) => !this.onlyUnread || !book.read);
  }

  toggleFilter(): void {
    this.onlyUnread = !this.onlyUnread;
  }

  toggleBook(id: number): void {
    this.books = this.books.map((book) =>
      book.id === id ? { ...book, read: !book.read } : book
    );
  }
}
