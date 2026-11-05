import std/[tables, sets, sequtils, asyncdispatch]

#[
    Type Systems & Variables
]#
# var is mutable, let binds a value once, and const is evaluated at compile time.
var score: int = 10
score += 5
let language = "Nim"
const limit = 20

#[
    Control Flow Operations
]#
# if can produce a value; for iterates through a range or collection.
let status = if score >= 10: "pass" else: "retry"
for value in 0 ..< 3:
  score += value

#[
    Execution Blocks
]#
# Procedures declare parameters and results; named blocks provide local scope.
proc add(left, right: int): int =
  left + right
block example:
  let local = add(2, 3)
  doAssert local == 5

#[
    Code Health & Documentation
]#
# Use # notes, #[ ... ]# block comments, and ## documentation comments.
# A single-line comment.
#[ A multi-line
   comment. ]#
proc square(value: int): int =
  ## Return the square of value.
  value * value

#[
    Built-In Collections
]#
# seq grows dynamically; Table maps keys and HashSet keeps unique values.
var values = @[1, 2, 3]
values.add(4)
var inventory = {"apples": 3}.toTable
let unique = toHashSet([1, 1, 2])

#[
    Data Mutability
]#
# Value-style sequence assignment preserves independent updates under normal Nim semantics.
var copied = values
copied[0] = 99
doAssert values[0] == 1

#[
    Access & Encapsulation
]#
# Unexported object fields stay private to their module; * marks exported declarations.
type Counter = object
  count: int
proc increment(counter: var Counter) =
  inc counter.count
var counter: Counter
counter.increment()

#[
    Design Paradigms & Patterns
]#
# Sequence operations and procedures support reusable transformations.
let doubled = values.mapIt(it * 2)
doAssert doubled[0] == 2

#[
    Memory Management
]#
# Managed values use the configured memory manager; deterministic cleanup can use defer.
block:
  var scratch = newSeq[int](4)
  defer: scratch.setLen(0)
  scratch[0] = 42

#[
    Concurrency & Parallelism
]#
# asyncdispatch schedules cooperative async procedures; it is not automatic CPU parallelism.
proc loadName(): Future[string] {.async.} =
  await sleepAsync(1)
  return "Ada"
let loadedName = waitFor loadName()

#[
    Performance Optimization
]#
# Reserve sequence capacity for known workloads; measure before changing abstractions.
var batch = newSeqOfCap[int](100)
for value in 0 ..< 100:
  batch.add(value)

echo "Hello, World!"
