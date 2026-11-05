// A data class supplies value equality, copy, and readable toString output.
data class Task(val title: String, val done: Boolean = false)

/** Build a label using an expression body and a default argument. */
fun label(title: String, done: Boolean = false): String =
    "[${if (done) "done" else "next"}] ${title.trim()}"

fun main() {
    // val fixes a binding; var permits reassignment; ? allows null.
    val owner: String = "Ada"
    var previewLimit = 2
    val showCompleted = false
    val nickname: String? = null
    println("Tasks for ${nickname ?: owner}")

    val tasks = listOf(
        Task("Read a chapter", done = true),
        Task("Water plants"),
        Task("Plan a walk")
    )

    // Read-only List exposes iteration without mutation operations.
    for (task in tasks) {
        if (showCompleted || !task.done) {
            println(label(task.title, task.done))
        }
    }

    // it is the implicit parameter in a single-argument lambda.
    val pending = tasks.filter { !it.done }.map { it.title }
    previewLimit = minOf(previewLimit, pending.size)
    println("Preview: ${pending.take(previewLimit).joinToString()}")

    val message = when (pending.size) {
        0 -> "All caught up"
        1 -> "One task left"
        else -> "Several tasks left"
    }
    println(message)

    val tags = setOf("home", "learning", "home")
    println("Unique tags: ${tags.sorted()}")
    val minutes = mapOf("reading" to 20, "walk" to 30)
    println("Missing estimate: ${minutes["gardening"] ?: 0}")

    // toMutableList makes a shallow copy with independent membership.
    val extended = pending.toMutableList()
    extended.add("Write a note")
    println("Original: ${pending.size}; copy: ${extended.size}")
    println("Completed copy: ${tasks.first().copy(done = false)}")

    val requested = "two".toIntOrNull() ?: previewLimit
    println("Requested preview size: $requested")
    println("Nickname length: ${nickname?.length ?: 0}")
}
