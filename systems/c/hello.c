#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <stdatomic.h>

static int add(int left, int right) { return left + right; }

int main(void) {

    /*
        Type Systems & Variables
    */
    // Declarations specify types; const prevents modification through that lvalue.
    int score = 10;
    const int limit = 20;
    size_t count = 3;

    /*
        Control Flow Operations
    */
    // Use if and loops for decisions; stay within array bounds.
    if (score < limit) { score += 1; }
    for (size_t index = 0; index < count; ++index) { score += (int)index; }

    /*
        Execution Blocks
    */
    // Braces establish block scope; functions such as add above group reusable operations.
    int sum = add(2, 3);
    { int local = 7; sum += local; }
    (void)sum;

    /*
        Code Health & Documentation
    */
    // C supports line and block comments; document ownership and preconditions.
    // A single-line comment.
    /* A multi-line comment.
       Block comments cannot be nested. */

    /*
        Built-In Collections
    */
    // Arrays are fixed-size contiguous sequences; maps and sets need an implementation or library.
    int values[] = {1, 2, 3};
    size_t value_count = sizeof values / sizeof values[0];
    (void)value_count;

    /*
        Data Mutability
    */
    // Assignment copies scalar values; pointers may refer to shared mutable storage.
    int copied = score;
    int *alias = &score;
    *alias += 1;
    (void)copied;

    /*
        Access & Encapsulation
    */
    // static gives this file's helper internal linkage; structs group exposed data.
    struct Counter { int value; };
    struct Counter counter = {0};
    counter.value += 1;
    (void)counter;

    /*
        Design Paradigms & Patterns
    */
    // Function pointers let callers supply a strategy with a matching signature.
    int (*combine)(int, int) = add;
    int combined = combine(2, 3);
    (void)combined;

    /*
        Memory Management
    */
    // Dynamic allocation needs failure handling and explicit release by its owner.
    int *buffer = malloc(4 * sizeof *buffer);
    if (buffer == NULL) { return 1; }
    buffer[0] = score;
    free(buffer);
    buffer = NULL;

    /*
        Concurrency & Parallelism
    */
    // C11 atomics synchronize individual operations; actual threads need a supported threading API.
    atomic_int ready = ATOMIC_VAR_INIT(0);
    atomic_store(&ready, 1);
    int observed = atomic_load(&ready);
    (void)observed;

    /*
        Performance Optimization
    */
    // Keep iteration simple, measure with representative inputs, and avoid undefined behavior.
    int total = 0;
    for (size_t index = 0; index < count; ++index) { total += values[index]; }
    (void)total;

    puts("Hello, World!");
    return 0;
}
