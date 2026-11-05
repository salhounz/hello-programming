#include <iostream>
#include <vector>
#include <map>
#include <unordered_set>
#include <memory>
#include <future>
#include <numeric>

int main() {

    /*
        Type Systems & Variables
    */
    // auto infers a static type; const prevents writes to the declared object.
    int score = 10;
    const int limit = 20;
    auto ready = true;
    (void)ready;

    /*
        Control Flow Operations
    */
    // Range-based loops visit collection elements; if handles decisions.
    if (score < limit) { ++score; }
    for (int value : {1, 2, 3}) { score += value; }

    /*
        Execution Blocks
    */
    // Lambdas are callable objects and braces delimit local scope.
    auto add = [](int left, int right) { return left + right; };
    const int sum = add(2, 3);
    (void)sum;

    /*
        Code Health & Documentation
    */
    // Use line comments, block comments, and documentation tools for public contracts.
    // A single-line comment.
    /* A multi-line comment.
       Explain ownership and invariants. */

    /*
        Built-In Collections
    */
    // vector is a dynamic sequence, map orders keys, and unordered_set stores unique values.
    std::vector<int> values{1, 2, 3};
    std::map<std::string, int> inventory{{"apples", 3}};
    std::unordered_set<int> unique{1, 1, 2};

    /*
        Data Mutability
    */
    // Containers copy their elements; references alias existing objects.
    auto copied = values;
    copied.push_back(4);
    auto& alias = values;
    alias[0] = 10;

    /*
        Access & Encapsulation
    */
    // Classes can keep state private and expose a small public interface.
    class Counter {
        int count_ = 0;
    public:
        void increment() { ++count_; }
        int value() const { return count_; }
    };
    Counter counter;
    counter.increment();

    /*
        Design Paradigms & Patterns
    */
    // Algorithms and callables support generic, composable operations.
    const int total = std::accumulate(values.begin(), values.end(), 0);
    (void)total;

    /*
        Memory Management
    */
    // RAII releases resources on scope exit; unique_ptr expresses exclusive ownership.
    auto owned = std::make_unique<int>(42);
    const int stored = *owned;
    (void)stored;

    /*
        Concurrency & Parallelism
    */
    // std::async with launch::async requests asynchronous execution; get waits and propagates errors.
    auto pending = std::async(std::launch::async, [] { return 42; });
    const int answer = pending.get();
    (void)answer;

    /*
        Performance Optimization
    */
    // Reserve capacity when a useful size is known; measure allocations and runtime.
    std::vector<int> batch;
    batch.reserve(100);
    for (int value = 0; value < 100; ++value) { batch.push_back(value); }

    std::cout << "Hello, World!\n";
}
