// Record fields have static types; bindings are immutable by default.
type Book =
    { Title: string
      Available: bool
      Tags: string list }

let books =
    [ { Title = "Dune"; Available = true; Tags = ["fiction"; "space"] }
      { Title = "Emma"; Available = false; Tags = ["fiction"] }
      { Title = "Sapiens"; Available = true; Tags = ["history"] } ]

/// Describe a book without changing its record.
let label book =
    let status = if book.Available then "on shelf" else "on loan"
    $"{book.Title} — {status}"

// Pipelines read as a sequence of transformations.
let availableTitles =
    books
    |> List.filter (fun book -> book.Available)
    |> List.map (fun book -> book.Title)
    |> List.sort

// Option forces us to handle an empty collection explicitly.
let firstTitle catalog =
    match List.tryHead catalog with
    | Some book -> book.Title
    | None -> "No books"

for book in books do
    printfn "%s" (label book)

printfn "Choose: %s" (String.concat ", " availableTitles)
printfn "First: %s" (firstTitle books)
printfn "Empty: %s" (firstTitle [])

// Copy-and-update preserves the original record.
let original = List.head books
let borrowed = { original with Available = false }
printfn "Original: %s" (label original)
printfn "Updated: %s" (label borrowed)

let catalog = books |> List.map (fun book -> book.Title, book) |> Map.ofList
match Map.tryFind "Dune" catalog with
| Some book -> printfn "Found: %s" (label book)
| None -> printfn "Missing title"

(* Async workflows describe work until started.
   These local workflows do not perform network or file operations. *)
let describe book = async { return label book }
let descriptions =
    books
    |> List.map describe
    |> Async.Parallel
    |> Async.RunSynchronously
printfn "Descriptions: %A" descriptions
