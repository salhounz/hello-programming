// Structs have value semantics; let properties cannot be reassigned.
struct Task {
    let title: String
    var done: Bool = false
}

/// Describe a task using named arguments and string interpolation.
func label(_ title: String, done: Bool = false) -> String {
    let status = done ? "done" : "next"
    return "[\(status)] \(title)"
}

let owner: String = "Ada"
var previewLimit = 2
let showCompleted = false
let nickname: String? = nil
print("Tasks for \(nickname ?? owner)")

let tasks = [
    Task(title: "Read a chapter", done: true),
    Task(title: "Water plants"),
    Task(title: "Plan a walk")
]

for task in tasks {
    if showCompleted || !task.done {
        print(label(task.title, done: task.done))
    }
}

// Closures filter and transform; $0 is the first closure argument.
let pending = tasks.filter { !$0.done }.map { $0.title }
previewLimit = min(previewLimit, pending.count)
print("Preview: \(pending.prefix(previewLimit).joined(separator: ", "))")

switch pending.count {
case 0:
    print("All caught up")
case 1:
    print("One task left")
default:
    print("Several tasks left")
}

let tags: Set<String> = ["home", "learning", "home"]
print("Unique tags: \(tags.sorted())")
let minutes = ["reading": 20, "walk": 30]
print("Missing estimate: \(minutes["gardening", default: 0])")

// Arrays also have value semantics: this append leaves pending unchanged.
var extended = pending
extended.append("Write a note")
print("Original: \(pending.count); copy: \(extended.count)")

// Conversion returns an Optional; ?? provides a fallback for nil.
let requested = Int("two") ?? previewLimit
print("Requested preview size: \(requested)")
if let name = nickname {
    print("Nickname length: \(name.count)")
}
