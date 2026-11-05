import java.util.concurrent.CompletableFuture
import java.io.StringReader

class Counter {
    private int count = 0
    void increment() { count++ }
    int value() { count }}

/*
    Type Systems & Variables
*/
// def infers a dynamic local variable; explicit types and final bindings are available.
def score = 10
score += 5
final String language = "Groovy"

/*
    Control Flow Operations
*/
// if, each, and collection predicates express decisions and iteration.
def status = score >= 10 ? "pass" : "retry"
[1, 2, 3].each { value -> score += value }

/*
    Execution Blocks
*/
// Methods and closures group reusable work.
def add = { int left, int right -> left + right }
def sum = add(2, 3)
assert sum == 5

/*
    Code Health & Documentation
*/
// Use line comments, block comments, and Groovydoc on declarations.
// A single-line comment.
/* A block comment spanning
   multiple lines. */
/** Describe a public declaration with Groovydoc. */

/*
    Built-In Collections
*/
// Lists are ordered, maps store keyed entries, and sets remove duplicates.
def values = [1, 2, 3]
def inventory = [apples: 3]
def unique = [1, 1, 2] as Set

/*
    Data Mutability
*/
// Assignment shares objects; collection constructors make shallow copies.
def copied = new ArrayList(values)
copied << 4
assert values.size() == 3

/*
    Access & Encapsulation
*/
// Private fields can be exposed through a deliberate method interface.
def counter = new Counter()
counter.increment()
assert counter.value() == 1

/*
    Design Paradigms & Patterns
*/
// collect transforms values and findAll filters them using closures.
def doubled = values.collect { it * 2 }
def selected = values.findAll { it > 1 }

/*
    Memory Management
*/
// JVM garbage collection handles objects; try/finally closes external resources.
def reader = new StringReader("sample")
try { def firstCharacter = reader.read() }
finally { reader.close() }

/*
    Concurrency & Parallelism
*/
// Java concurrency libraries are available through JVM interoperability.
def task = CompletableFuture.supplyAsync { 42 }
def answer = task.join()
assert answer == 42

/*
    Performance Optimization
*/
// Use a set for repeated membership checks and profile dynamic hotspots before rewriting.
def allowed = ["Ada", "Grace"] as Set
def isAllowed = allowed.contains("Ada")

println 'Hello, World!'
