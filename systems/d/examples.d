import std.stdio : writeln;
import std.algorithm : filter, map;
import std.array : array, join;

// A struct is a value type; strings are immutable character slices.
struct Task {
    string name;
    bool done;
}

/// Format one task without changing it.
string describe(const Task task) {
    return (task.done ? "[x] " : "[ ] ") ~ task.name;
}

void main() {
    immutable title = "Launch checklist";
    Task[] tasks = [
        Task("Read the guide", true),
        Task("Build a sample", false)
    ];
    tasks ~= Task("Share notes", false);

    // ref gives the loop variable access to the original element.
    foreach (ref task; tasks) {
        if (!task.done) {
            task.done = true;
            break;
        }
    }

    writeln(title);
    foreach (task; tasks) {
        writeln(describe(task));
    }

    // Ranges compose lazily; array materializes the selected names.
    auto pending = tasks.filter!(task => !task.done)
        .map!(task => task.name).array;
    writeln("Pending: ", pending.join(", "));

    size_t[string] counts;
    foreach (task; tasks) {
        auto label = task.done ? "done" : "pending";
        counts[label] = counts.get(label, 0) + 1;
    }
    writeln("Completed: ", counts.get("done", 0), "/", tasks.length);

    // Slices share storage; dup creates an independent array of Task values.
    auto draft = tasks.dup;
    draft[0].name = "Read the revised guide";
    writeln("Original: ", tasks[0].name);
    writeln("Draft: ", draft[0].name);
}
