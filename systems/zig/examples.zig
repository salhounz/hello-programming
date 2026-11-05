const std = @import("std");

const Task = struct {
    name: []const u8,
    done: bool = false,
};

/// Borrow a slice of tasks; return null if all tasks are complete.
fn firstPending(tasks: []const Task) ?usize {
    for (tasks, 0..) |task, index| {
        if (!task.done) return index;
    }
    return null;
}

fn printTask(task: Task) void {
    const marker: u8 = if (task.done) 'x' else ' ';
    std.debug.print("[{c}] {s}\n", .{ marker, task.name });
}

pub fn main() void {
    const title = "Launch checklist";
    var tasks = [_]Task{
        .{ .name = "Read the guide", .done = true },
        .{ .name = "Build a sample" },
        .{ .name = "Share notes" },
    };

    // Optional capture unwraps the index only when it exists.
    if (firstPending(tasks[0..])) |index| {
        tasks[index].done = true;
    } else {
        std.debug.print("Nothing to update\n", .{});
    }

    std.debug.print("{s}\n", .{title});
    var completed: usize = 0;
    for (tasks) |task| {
        printTask(task);
        if (task.done) completed += 1;
    }
    std.debug.print("Completed: {d}/{d}\n", .{ completed, tasks.len });

    // Arrays copy their elements; the string slices still view literal bytes.
    var draft = tasks;
    draft[0].name = "Read the revised guide";
    std.debug.print("Original: {s}\n", .{tasks[0].name});
    std.debug.print("Draft: {s}\n", .{draft[0].name});

    const phase = if (completed == tasks.len) "ready" else "in progress";
    std.debug.print("Phase: {s}\n", .{phase});
    std.debug.assert(completed == 2);
}
