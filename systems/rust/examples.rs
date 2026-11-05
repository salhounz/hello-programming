use std::collections::BTreeMap;

// String owns its text; bool models a task's state.
struct Task {
    name: String,
    done: bool,
}

/// Borrow a task without taking ownership of it.
fn print_task(task: &Task) {
    let marker = if task.done { 'x' } else { ' ' };
    println!("[{marker}] {}", task.name);
}

fn main() {
    let title: &str = "Launch checklist";
    let mut tasks = vec![
        Task { name: String::from("Read the guide"), done: true },
        Task { name: String::from("Build a sample"), done: false },
    ];
    tasks.push(Task { name: String::from("Share notes"), done: false });

    // Option requires handling the possibility that no task matches.
    match tasks.iter_mut().find(|task| !task.done) {
        Some(task) => task.done = true,
        None => println!("Nothing to update"),
    }

    println!("{title}");
    for task in &tasks {
        print_task(task);
    }

    // Iterators borrow elements; collect builds a new collection.
    let pending: Vec<&str> = tasks.iter()
        .filter(|task| !task.done)
        .map(|task| task.name.as_str())
        .collect();
    println!("Pending: {}", pending.join(", "));

    let mut counts = BTreeMap::new();
    for task in &tasks {
        let label = if task.done { "done" } else { "pending" };
        *counts.entry(label).or_insert(0usize) += 1;
    }
    for (label, count) in counts {
        println!("{label}: {count}");
    }

    // Result also makes failure explicit; this conversion needs no input file.
    match "3".parse::<usize>() {
        Ok(limit) => println!("Within limit: {}", tasks.len() <= limit),
        Err(error) => println!("Invalid limit: {error}"),
    }
}
