defmodule Examples do
  @moduledoc "A small, immutable shelf catalog."

  # Atoms name keys, strings hold text, and booleans express state.
  def books do
    [
      %{title: "Dune", available?: true, tags: [:fiction, :space]},
      %{title: "Emma", available?: false, tags: [:fiction]},
      %{title: "Sapiens", available?: true, tags: [:history]}
    ]
  end

  @doc "Pattern matching extracts a book's fields."
  def label(%{title: title, available?: available?}) do
    status = if available?, do: "on shelf", else: "on loan"
    "#{title} — #{status}"
  end

  # Separate function clauses express the empty and nonempty cases.
  def first_title([]), do: "No books"
  def first_title([%{title: title} | _rest]), do: title

  def run do
    catalog = books()

    # The pipeline passes each result as the next first argument.
    available_titles =
      catalog
      |> Enum.filter(& &1.available?)
      |> Enum.map(& &1.title)
      |> Enum.sort()

    Enum.each(catalog, fn book -> IO.puts(label(book)) end)
    IO.puts("Choose: #{Enum.join(available_titles, ", ")}")
    IO.puts("First: #{first_title(catalog)}")
    IO.puts(first_title([]))

    # Updating a map creates a new value.
    [original | _] = catalog
    borrowed = %{original | available?: false}
    IO.puts("Original: #{label(original)}")
    IO.puts("Updated: #{label(borrowed)}")

    # Tuples commonly distinguish successful and missing lookups.
    case Map.fetch(original, :title) do
      {:ok, title} -> IO.puts("Found: #{title}")
      :error -> IO.puts("Missing title")
    end

    # A task runs in another process; await retrieves its result.
    task = Task.async(fn -> Enum.count(catalog, & &1.available?) end)
    IO.puts("Available count: #{Task.await(task)}")
  end
end

Examples.run()
