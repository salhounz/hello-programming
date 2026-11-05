const std = @import("std");

pub fn main() !void {

    //
    //    Type Systems & Variables
    //
    // var allows mutation; const fixes a binding and types can be inferred.
    var score: u32 = 10;
    score += 5;
    const limit: u32 = 20;

    //
    //    Control Flow Operations
    //
    // if is an expression; for loops visit sequence values.
    const status: []const u8 = if (score < limit) "practice" else "ready";
    _ = status;
    for ([_]u32{ 1, 2, 3 }) |value| { score += value; }
    std.debug.assert(score == 21);

    //
    //    Execution Blocks
    //
    // Blocks can return values using a label and break.
    const sum = calculation: {
        const left: u32 = 2;
        break :calculation left + 3;
    };
    std.debug.assert(sum == 5);

    //
    //    Code Health & Documentation
    //
    // Zig uses line comments and /// documentation; there is no C-style block-comment syntax.
    // A single-line note.
    // Multiple adjacent line comments form a longer explanation.
    // Use /// on declarations for generated documentation.

    //
    //    Built-In Collections
    //
    // Arrays have fixed length; slices are pointer-and-length views over elements.
    const values = [_]u8{ 1, 2, 3 };
    const view: []const u8 = values[0..];
    std.debug.assert(view.len == 3);

    //
    //    Data Mutability
    //
    // Const bindings and read-only pointees are different; array assignment copies elements.
    var copied = values;
    copied[0] = 99;
    std.debug.assert(values[0] == 1);

    //
    //    Access & Encapsulation
    //
    // pub controls declaration visibility; a struct groups data and associated functions.
    const Counter = struct {
        count: u32 = 0,
        pub fn increment(self: *@This()) void { self.count += 1; }
    };
    var counter = Counter{};
    counter.increment();
    std.debug.assert(counter.count == 1);

    //
    //    Design Paradigms & Patterns
    //
    // comptime evaluates known expressions during compilation and supports generic designs.
    const doubled = comptime 21 * 2;
    std.debug.assert(doubled == 42);

    //
    //    Memory Management
    //
    // Allocation is explicit; defer ensures the allocation is freed at scope exit.
    const allocator = std.heap.page_allocator;
    const buffer = try allocator.alloc(u8, 4);
    defer allocator.free(buffer);
    @memset(buffer, 0);

    //
    //    Concurrency & Parallelism
    //
    // Atomic operations coordinate shared state; they do not start threads.
    var shared: u32 = 0;
    @atomicStore(u32, &shared, 1, .seq_cst);
    const observed = @atomicLoad(u32, &shared, .seq_cst);
    std.debug.assert(observed == 1);

    //
    //    Performance Optimization
    //
    // Prefer clear bounds and allocation behavior; measure before changing optimization modes.
    var total: u32 = 0;
    for (view) |value| { total += value; }
    std.debug.assert(total == 6);

    std.debug.print("Hello, World!\n", .{});
}
