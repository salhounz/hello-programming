#include <stdbool.h>
#include <stddef.h>
#include <stdio.h>
#include <string.h>

/* A struct groups values; string literals are read through const pointers. */
typedef struct {
    const char *name;
    bool done;
} Task;

// static keeps this helper private to this translation unit.
static void print_task(const Task *task) {
    printf("[%c] %s\n", task->done ? 'x' : ' ', task->name);
}

static size_t count_done(const Task tasks[], size_t count) {
    size_t done = 0;
    for (size_t index = 0; index < count; ++index) {
        if (tasks[index].done) {
            ++done;
        }
    }
    return done;
}

int main(void) {
    const char *title = "Launch checklist";
    Task tasks[] = {
        {"Read the guide", true},
        {"Build a sample", false},
        {"Share notes", false}
    };
    const size_t count = sizeof tasks / sizeof tasks[0];

    // A pointer can update an existing element without copying the array.
    Task *next = &tasks[1];
    next->done = true;
    puts(title);
    for (size_t index = 0; index < count; ++index) {
        print_task(&tasks[index]);
    }

    // C strings end at a zero byte; strlen excludes that terminator.
    printf("Title length: %zu\n", strlen(title));
    const size_t completed = count_done(tasks, count);
    printf("Completed: %zu/%zu\n", completed, count);
    if (completed == count) {
        puts("Ready to launch");
    } else {
        puts("Keep going");
    }
    return 0;
}
