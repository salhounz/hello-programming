"""A small reading list; run with Python 3.9 or newer."""

# Annotations describe intent; Python still checks operations at runtime.
owner: str = "Ada"
limit: int = 2
notifications: bool = True
nickname = None


def label(title: str, finished: bool = False) -> str:
    """Build a display label without changing the title."""
    status = "done" if finished else "next"
    return f"[{status}] {title.strip()}"


def main() -> None:
    # Dictionaries describe entries; a list preserves their order.
    books = [
        {"title": "The Hobbit", "finished": True},
        {"title": "Dune", "finished": False},
        {"title": " Earthsea ", "finished": False},
    ]
    print(f"Reading list for {nickname or owner}")

    # Indentation defines suites; enumerate supplies an index and a value.
    for position, book in enumerate(books, start=1):
        print(position, label(book["title"], book["finished"]))

    pending = [book["title"].strip() for book in books if not book["finished"]]
    if notifications and pending:
        print("Up next:", ", ".join(pending[:limit]))
    else:
        print("Nothing to announce")

    # Sets deduplicate values; sorted makes their display deterministic.
    tags = {"fiction", "classic", "fiction"}
    print("Tags:", sorted(tags))
    counts = {"finished": sum(book["finished"] for book in books)}
    print("Finished:", counts.get("finished", 0))

    # A list copy is independent, but nested dictionaries would be shared.
    titles = [book["title"].strip() for book in books]
    extended = titles.copy()
    extended.append("Foundation")
    print("Original titles:", len(titles), "extended:", len(extended))

    # Conversion can fail: catch the specific exception you can handle.
    try:
        requested = int("two")
    except ValueError:
        requested = limit
    print("Preview:", pending[:requested])


if __name__ == "__main__":
    main()
