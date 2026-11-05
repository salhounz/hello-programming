import std.stdio;
import std.algorithm : map;
import std.array : array;
import std.concurrency : Tid, spawn, send, receiveOnly, thisTid;

void worker(Tid owner) { send(owner, 42); }

void main() {

    /*
        Type Systems & Variables
    */
    // auto infers a static type; immutable fixes data, while const provides read-only access.
    int score = 10;
    score += 5;
    immutable string language = "D";
    const int limit = 20;

    /*
        Control Flow Operations
    */
    // if and foreach express decisions and iteration.
    auto status = score >= 10 ? "pass" : "retry";
    foreach (value; 0 .. 3) { score += value; }

    /*
        Execution Blocks
    */
    // Functions and delegates organize reusable calculations.
    int add(int left, int right) { return left + right; }
    auto sum = add(2, 3);
    assert(sum == 5);

    /*
        Code Health & Documentation
    */
    // D has line comments, block comments, nested /+ +/ comments, and Ddoc.
    // A single-line comment.
    /* A block comment. */
    /+ Outer comment /+ nested comment +/ +/
    /// Return the square of value.
    int square(int value) { return value * value; }

    /*
        Built-In Collections
    */
    // Dynamic arrays are slices; associative arrays map typed keys to values.
    int[] values = [1, 2, 3];
    int[string] inventory;
    inventory["apples"] = 3;

    /*
        Data Mutability
    */
    // Array assignment shares elements; dup creates an independent mutable copy.
    auto alias = values;
    alias[0] = 10;
    auto copied = values.dup;
    copied[0] = 99;
    assert(values[0] == 10);

    /*
        Access & Encapsulation
    */
    // private restricts access at module scope; methods provide a controlled interface.
    struct Counter {
        private int count;
        void increment() { ++count; }
        int value() const { return count; }
    }
    Counter counter;
    counter.increment();

    /*
        Design Paradigms & Patterns
    */
    // Ranges and templates compose lazy transformations; array materializes a result.
    auto doubled = values.map!(value => value * 2).array;
    assert(doubled[0] == 20);

    /*
        Memory Management
    */
    // The GC manages ordinary arrays; scope(exit) guarantees lexical cleanup actions.
    int[] scratch = new int[4];
    {
        scope(exit) scratch = null;
        scratch[0] = 42;
    }

    /*
        Concurrency & Parallelism
    */
    // Message passing communicates between threads without sharing mutable local arrays.
    auto workerId = spawn(&worker, thisTid);
    auto answer = receiveOnly!int();
    assert(answer == 42);

    /*
        Performance Optimization
    */
    // Reserve or reuse data when useful; avoid materializing lazy ranges unnecessarily.
    auto selected = values.map!(value => value + 1);
    assert(selected.front == 11);

    writeln("Hello, World!");
}
