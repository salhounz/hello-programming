import java.io.ByteArrayInputStream
import java.util.concurrent.Executors

fun main() {

    /*
        Type Systems & Variables
    */
    // var is reassignable; val fixes a binding, and nullable types end in ?.
    var score: Int = 10
    score += 5
    val language = "Kotlin"
    val missingName: String? = null

    /*
        Control Flow Operations
    */
    // if and when are expressions; for iterates through ranges and collections.
    val displayName = missingName ?: "Guest"
    val result = when { score >= 10 -> "pass"; else -> "retry" }
    for (value in 1..3) { score += value }

    /*
        Execution Blocks
    */
    // Functions can use expression bodies and default arguments.
    fun add(left: Int, right: Int): Int = left + right
    fun greet(name: String = "World") = "Hello, $name!"
    val sum = add(2, 3)

    /*
        Code Health & Documentation
    */
    // Use //, nested block comments, and KDoc on declarations.
    // A single-line comment.
    /* A block comment
       can span multiple lines. */
    /** Return a squared integer. */
    fun square(value: Int): Int = value * value

    /*
        Built-In Collections
    */
    // List is ordered, Map associates keys, and Set removes duplicate members.
    val values = listOf(1, 2, 3)
    val inventory = mapOf("apples" to 3)
    val unique = setOf(1, 1, 2)

    /*
        Data Mutability
    */
    // Read-only and mutable collection interfaces differ; toMutableList makes a shallow copy.
    val copied = values.toMutableList()
    copied.add(4)
    check(values.size == 3)

    /*
        Access & Encapsulation
    */
    // Visibility and private setters keep updates behind explicit operations.
    class Counter {
        var value = 0
            private set
        fun increment() { value++ }
    }
    val counter = Counter()
    counter.increment()

    /*
        Design Paradigms & Patterns
    */
    // Higher-order collection operations and lambdas support functional composition.
    val doubled = values.map { it * 2 }
    val total = values.fold(0) { sum, value -> sum + value }

    /*
        Memory Management
    */
    // JVM garbage collection handles objects; use closes a supported resource after the block.
    ByteArrayInputStream(byteArrayOf(1, 2, 3)).use { stream ->
        val firstByte = stream.read()
    }

    /*
        Concurrency & Parallelism
    */
    // Executor services run tasks on JVM worker threads; shutdown releases the service.
    val executor = Executors.newSingleThreadExecutor()
    try {
        val task = executor.submit<Int> { 42 }
        check(task.get() == 42)
    } finally {
        executor.shutdown()
    }

    /*
        Performance Optimization
    */
    // Reuse sets for membership checks and avoid intermediate collections in large pipelines.
    val allowed = setOf("Ada", "Grace")
    val isAllowed = "Ada" in allowed

    println("Hello, World!")
}
