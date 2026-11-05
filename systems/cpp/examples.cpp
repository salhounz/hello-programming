#include <algorithm>
#include <iostream>
#include <map>
#include <string>
#include <vector>

// Values own their strings; containers clean up automatically at scope exit.
struct Task {
    std::string name;
    bool done = false;
};

void print_task(const Task& task) {
    std::cout << (task.done ? "[x] " : "[ ] ") << task.name << '\n';
}

int main() {
    const std::string title = "Launch checklist";
    std::vector<Task> tasks{
        {"Read the guide", true},
        {"Build a sample", false}
    };
    tasks.push_back({"Share notes", false});

    // auto infers the iterator type; a lambda supplies the search predicate.
    auto next = std::find_if(tasks.begin(), tasks.end(), [](const Task& task) {
        return !task.done;
    });
    if (next != tasks.end()) {
        next->done = true;
    }

    std::cout << title << '\n';
    for (const auto& task : tasks) {
        print_task(task);
    }

    std::map<std::string, int> counts{{"done", 0}, {"pending", 0}};
    for (const auto& task : tasks) {
        ++counts[task.done ? "done" : "pending"];
    }
    // Structured bindings unpack map entries in key order.
    for (const auto& [label, count] : counts) {
        std::cout << label << ": " << count << '\n';
    }

    // Container assignment copies values; a reference would alias them.
    auto draft = tasks;
    draft.front().name = "Read the revised guide";
    std::cout << "Original: " << tasks.front().name << '\n';
    std::cout << "Draft: " << draft.front().name << '\n';
    return 0;
}
