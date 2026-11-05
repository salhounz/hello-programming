(* Record fields have static types. Values are immutable by default. *)
type book = {
  title : string;
  available : bool;
  tags : string list;
}

let books = [
  { title = "Dune"; available = true; tags = ["fiction"; "space"] };
  { title = "Emma"; available = false; tags = ["fiction"] };
  { title = "Sapiens"; available = true; tags = ["history"] };
]

(* Functions return values; the final expression is the result. *)
let label book =
  let status = if book.available then "on shelf" else "on loan" in
  book.title ^ " — " ^ status

let first_title catalog =
  match catalog with
  | [] -> "No books"
  | book :: _rest -> book.title

(* |> passes a value to the next function. *)
let available_titles =
  books
  |> List.filter (fun book -> book.available)
  |> List.map (fun book -> book.title)
  |> List.sort String.compare

(* A functor builds a map whose keys are strings. *)
module Catalog = Map.Make (String)

let catalog =
  List.fold_left
    (fun result book -> Catalog.add book.title book result)
    Catalog.empty books

let () =
  print_endline "Neighborhood shelf";
  List.iter (fun book -> print_endline (label book)) books;
  Printf.printf "Choose: %s\n" (String.concat ", " available_titles);
  Printf.printf "First: %s\n" (first_title books);
  Printf.printf "Empty: %s\n" (first_title []);

  (* Record update preserves the original. *)
  let original = { title = "Dune"; available = true; tags = [] } in
  let borrowed = { original with available = false } in
  Printf.printf "Original: %s\n" (label original);
  Printf.printf "Updated: %s\n" (label borrowed);

  (* Options make absence explicit and pattern matching handles it. *)
  match Catalog.find_opt "Dune" catalog with
  | Some book -> Printf.printf "Found: %s\n" (label book)
  | None -> print_endline "Missing title"
