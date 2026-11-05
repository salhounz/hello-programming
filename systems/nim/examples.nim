import std/[tables, sequtils, strutils, options]

#[ Objects group related fields.
   Indentation defines blocks; strings and bools have static types. ]#
type Task = object
  name: string
  done: bool

proc describe(task: Task): string =
  ## Return a display label without changing the task.
  let marker = if task.done: "[x] " else: "[ ] "
  marker & task.name

proc firstPending(tasks: seq[Task]): Option[int] =
  for index, task in tasks:
    if not task.done:
      return some(index)
  return none(int)

const title = "Launch checklist"
var tasks = @[
  Task(name: "Read the guide", done: true),
  Task(name: "Build a sample", done: false)
]
tasks.add Task(name: "Share notes", done: false)

# Option represents a result that may be absent.
let next = firstPending(tasks)
if next.isSome:
  tasks[next.get].done = true
else:
  echo "Nothing to update"

echo title
for task in tasks:
  echo describe(task)

# it is the current element in these sequence templates.
let pending = tasks.filterIt(not it.done).mapIt(it.name)
echo "Pending: ", pending.join(", ")

var counts = initTable[string, int]()
for task in tasks:
  let label = if task.done: "done" else: "pending"
  counts[label] = counts.getOrDefault(label) + 1
echo "Completed: ", counts.getOrDefault("done"), "/", tasks.len

# Sequence values support independent updates after assignment.
var draft = tasks
draft[0].name = "Read the revised guide"
echo "Original: ", tasks[0].name
echo "Draft: ", draft[0].name

doAssert pending == @["Share notes"]
