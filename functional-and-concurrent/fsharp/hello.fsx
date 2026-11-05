open System
open System.IO

(*
    Type Systems & Variables
*)
// let binds an inferred static type; mutable permits reassignment.
let language = "F#"
let mutable score = 10
score <- score + 5

(*
    Control Flow Operations
*)
// if is an expression and match handles alternatives explicitly.
let result = if score >= 10 then "pass" else "retry"
for value in [1; 2; 3] do score <- score + value

(*
    Execution Blocks
*)
// Functions are values and indentation groups expressions.
let add left right = left + right
let sum =
    let local = 2
    add local 3

(*
    Code Health & Documentation
*)
// Use // comments, (* *) blocks, and /// XML documentation.
// A single-line comment.
(* A multi-line
   comment. *)
/// Return the square of value.
let square value = value * value

(*
    Built-In Collections
*)
// Lists are immutable sequences; arrays are mutable, Map is keyed, and Set stores unique values.
let values = [1; 2; 3]
let point = [|10; 20|]
let inventory = Map.ofList [("apples", 3)]
let unique = Set.ofList [1; 1; 2]

(*
    Data Mutability
*)
// Record updates create a new record; arrays support explicit element mutation.
type Settings = { Theme: string }
let settings = { Theme = "light" }
let updated = { settings with Theme = "dark" }
point.[0] <- 99

(*
    Access & Encapsulation
*)
// Private fields and members encapsulate object state when an object model is useful.
type Counter() =
    let mutable count = 0
    member _.Increment() = count <- count + 1
    member _.Value = count
let counter = Counter()
counter.Increment()

(*
    Design Paradigms & Patterns
*)
// Pipelines, functions, and discriminated unions model transformations and alternatives.
type Status = Pass | Retry
let doubled = values |> List.map (fun value -> value * 2)
let total = values |> List.sum

(*
    Memory Management
*)
// The GC manages objects; use disposes resources when a function scope exits.
let readExample () =
    use reader = new StringReader("sample")
    reader.Read()
let firstCharacter = readExample ()

(*
    Concurrency & Parallelism
*)
// Async.Parallel coordinates workflows; it does not automatically parallelize arbitrary CPU work.
let tasks = [async { do! Async.Sleep 1; return 21 }; async { return 21 }]
let answers = tasks |> Async.Parallel |> Async.RunSynchronously

(*
    Performance Optimization
*)
// Prefer sequence or collection operations suited to the workload and benchmark hotspots.
let allowed = Set.ofList ["Ada"; "Grace"]
let isAllowed = Set.contains "Ada" allowed

printfn "Hello, World!"
