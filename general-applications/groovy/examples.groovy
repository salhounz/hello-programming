// A script runs top to bottom on the JVM; def permits dynamic typing.
final String owner = 'Ada'
int previewLimit = 2
boolean showCompleted = false
String nickname = null
println "Tasks for ${nickname ?: owner}"

/** Build a display label; the last expression is returned implicitly. */
String label(String title, boolean done = false) {
    "${done ? '[done]' : '[next]'} ${title.trim()}"
}

// Lists preserve order; map literals use named keys.
def tasks = [
    [title: 'Read a chapter', done: true],
    [title: 'Water plants', done: false],
    [title: 'Plan a walk', done: false]
]

// each receives a closure; property syntax reads the map's named keys.
tasks.each { task ->
    if (showCompleted || !task.done) {
        println label(task.title, task.done)
    }
}

def pending = tasks.findAll { !it.done }.collect { it.title }
println "Preview: ${pending.take(previewLimit).join(', ')}"

// Groovy truth treats empty collections as false.
if (pending) {
    println "Remaining tasks: ${pending.size()}"
} else {
    println 'All caught up'
}

def tags = ['home', 'learning', 'home'] as Set
println "Unique tags: ${tags.sort()}"
def minutes = [reading: 20, walk: 30]
println "Walk minutes: ${minutes.walk}"

// Safe navigation returns null when the receiver is null.
println "Nickname length: ${nickname?.length() ?: 0}"

// A shallow copy has independent membership, while nested objects can share.
def extended = new ArrayList(pending)
extended << 'Write a note'
println "Original: ${pending.size()}; copy: ${extended.size()}"

// Catch a specific Java exception when a conversion fails.
try {
    println Integer.parseInt('two')
} catch (NumberFormatException ignored) {
    println "Using default preview size: $previewLimit"
}
