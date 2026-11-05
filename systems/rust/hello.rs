use std::collections::{HashMap, HashSet};
use std::thread;

fn main() {

    /*
        Type Systems & Variables
    */
    // Bindings are immutable by default; mut enables reassignment or mutable access.
    let mut score: i32 = 10;
    score += 5;
    let language = "Rust";
    let _ = (score, language);

    /*
        Control Flow Operations
    */
    // if is an expression; loops can iterate through values without indexing.
    let status = if score >= 10 { "pass" } else { "retry" };
    for value in 0..3 { score += value; }
    let _ = status;

    /*
        Execution Blocks
    */
    // Functions declare parameter types; a final expression becomes the return value.
    fn add(left: i32, right: i32) -> i32 { left + right }
    let sum = { let local = 2; add(local, 3) };
    assert_eq!(sum, 5);

    /*
        Code Health & Documentation
    */
    // Use // for notes, block comments for spans, and /// for generated API documentation.
    // A single-line comment.
    /* A block comment can span
       multiple lines. */
    /// Return the square of an integer.
    fn square(value: i32) -> i32 { value * value }
    assert_eq!(square(3), 9);

    /*
        Built-In Collections
    */
    // Vec grows dynamically; HashMap associates keys with values and HashSet stores unique values.
    let values = vec![1, 2, 3];
    let mut inventory = HashMap::new();
    inventory.insert("apples", 3);
    let unique: HashSet<_> = [1, 1, 2].iter().copied().collect();
    assert_eq!(unique.len(), 2);

    /*
        Data Mutability
    */
    // Borrowing shares access without copying; clone makes an explicit owned copy.
    let mut copied = values.clone();
    copied.push(4);
    let borrowed = &values;
    assert_eq!(borrowed.len(), 3);

    /*
        Access & Encapsulation
    */
    // Fields are private outside their module by default; pub controls visibility.
    mod counters {
        pub struct Counter { count: u32 }
        impl Counter {
            pub fn new() -> Self { Self { count: 0 } }
            pub fn increment(&mut self) { self.count += 1; }
            pub fn value(&self) -> u32 { self.count }
        }
    }
    let mut counter = counters::Counter::new();
    counter.increment();
    assert_eq!(counter.value(), 1);

    /*
        Design Paradigms & Patterns
    */
    // Iterators and closures express transformations; enums model alternatives explicitly.
    let doubled: Vec<_> = values.iter().map(|value| value * 2).collect();
    let first: Option<&i32> = values.first();
    assert_eq!(doubled[0], 2);
    let _ = first;

    /*
        Memory Management
    */
    // Owners drop values at scope exit; Box owns heap allocation without a garbage collector.
    let owned = Box::new(42);
    assert_eq!(*owned, 42);
    drop(owned);

    /*
        Concurrency & Parallelism
    */
    // Threads can run in parallel; joining waits for completion and reports a panic.
    let worker = thread::spawn(|| 42);
    let answer = worker.join().expect("worker panicked");
    assert_eq!(answer, 42);

    /*
        Performance Optimization
    */
    // Preallocate when size is known and avoid needless allocations after measuring.
    let mut batch = Vec::with_capacity(100);
    batch.extend(0..100);
    assert_eq!(batch.len(), 100);

    println!("Hello, World!");
}
