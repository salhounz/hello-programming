import Foundation
import Dispatch

/*
    Type Systems & Variables
*/
// var permits changes; let creates a constant binding, and ? marks optional values.
var score: Int = 10
score += 5
let language = "Swift"
let missingName: String? = nil

/*
    Control Flow Operations
*/
// if, for, and optional binding handle branching and iteration.
let displayName = missingName ?? "Guest"
if score >= 10 { score += 1 }
for value in 1...3 { score += value }

/*
    Execution Blocks
*/
// Functions declare parameters and return types; closures are first-class values.
func add(_ left: Int, _ right: Int) -> Int { left + right }
let sum = add(2, 3)
let double = { (value: Int) in value * 2 }

/*
    Code Health & Documentation
*/
// Use line and block comments, with /// documentation on declarations.
// A single-line comment.
/* A multi-line
   comment. */
/// Return the square of an integer.
func square(_ value: Int) -> Int { value * value }

/*
    Built-In Collections
*/
// Array is ordered, Dictionary maps keys, and Set holds unique elements.
let values = [1, 2, 3]
let inventory = ["apples": 3]
let unique: Set<Int> = [1, 1, 2]

/*
    Data Mutability
*/
// Arrays and dictionaries have value semantics; class assignments share references.
var copied = values
copied.append(4)
assert(values.count == 3)

/*
    Access & Encapsulation
*/
// Private stored properties and computed getters expose only selected state.
final class Counter {
    private var count = 0
    var value: Int { count }
    func increment() { count += 1 }
}
let counter = Counter()
counter.increment()

/*
    Design Paradigms & Patterns
*/
// Protocols, closures, and sequence operations support composable designs.
let doubled = values.map { $0 * 2 }
let total = values.reduce(0, +)

/*
    Memory Management
*/
// ARC manages class instances; weak references do not keep their target alive.
final class Owner {}
var owner: Owner? = Owner()
weak var weakOwner = owner
owner = nil
assert(weakOwner == nil)

/*
    Concurrency & Parallelism
*/
// Dispatch queues can schedule concurrent work; wait here is appropriate only for this CLI example.
let group = DispatchGroup()
group.enter()
DispatchQueue.global().async { group.leave() }
group.wait()

/*
    Performance Optimization
*/
// Use sets for repeated membership checks and measure before changing allocation behavior.
let allowed: Set<String> = ["Ada", "Grace"]
let isAllowed = allowed.contains("Ada")

print("Hello, World!")
