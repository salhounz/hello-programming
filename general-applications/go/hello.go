package main

import (
    "fmt"
    "io"
    "strings"
)

func add(left, right int) int { return left + right }

func main() {

    /*
        Type Systems & Variables
    */
    // var declares a value; := infers a local type, and const defines a constant.
    score := 10
    score += 5
    const language = "Go"
    _ = language

    /*
        Control Flow Operations
    */
    // Go uses if and for; for also handles range iteration.
    status := "retry"
    if score >= 10 { status = "pass" }
    for _, value := range []int{1, 2, 3} { score += value }
    _ = status

    /*
        Execution Blocks
    */
    // Functions group reusable operations; braces delimit scope.
    sum := add(2, 3)
    { local := 7; sum += local }
    _ = sum

    /*
        Code Health & Documentation
    */
    // Use // for notes and documentation and /* */ for longer comments.
    // A single-line comment.
    /* A multi-line comment.
       Exported declarations should have useful documentation. */

    /*
        Built-In Collections
    */
    // Arrays have fixed length; slices grow; maps store typed keys and values.
    values := []int{1, 2, 3}
    inventory := map[string]int{"apples": 3}
    unique := map[int]struct{}{1: {}, 2: {}}
    _ = inventory
    _ = unique

    /*
        Data Mutability
    */
    // Copy slice elements when independent mutation is required.
    copied := make([]int, len(values))
    copy(copied, values)
    copied[0] = 99

    /*
        Access & Encapsulation
    */
    // Uppercase names are exported from a package; closures can hide local state.
    count := 0
    increment := func() int { count++; return count }
    observed := increment()
    _ = observed

    /*
        Design Paradigms & Patterns
    */
    // Functions and interfaces support composition without a class hierarchy.
    transform := func(items []int, strategy func(int) int) []int {
        result := make([]int, len(items))
        for index, value := range items { result[index] = strategy(value) }
        return result
    }
    doubled := transform(values, func(value int) int { return value * 2 })
    _ = doubled

    /*
        Memory Management
    */
    // Garbage collection manages memory; defer performs explicit resource cleanup.
    reader := io.NopCloser(strings.NewReader("sample"))
    defer reader.Close()

    /*
        Concurrency & Parallelism
    */
    // A goroutine sends a value through a channel; receiving waits for the result.
    answers := make(chan int)
    go func() { answers <- 42 }()
    answer := <-answers
    _ = answer

    /*
        Performance Optimization
    */
    // Preallocate slices when a useful capacity is known; benchmark before tuning.
    batch := make([]int, 0, 100)
    for index := 0; index < 100; index++ { batch = append(batch, index) }

    fmt.Println("Hello, World!")
}
