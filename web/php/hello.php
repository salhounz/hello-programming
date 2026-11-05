<?php
declare(strict_types=1);

/*
    Type Systems & Variables
*/
// Variables use $; const defines constants and type declarations document boundaries.
$score = 10;
$score += 5;
const LANGUAGE = "PHP";
$name = "Ada";
$isReady = true;

/*
    Control Flow Operations
*/
// if, foreach, and match express decisions and iteration.
$result = $score >= 10 ? "pass" : "retry";
$action = match ($result) { "pass" => "continue", default => "practice" };
foreach ([1, 2, 3] as $value) {
    $score += $value;
}

/*
    Execution Blocks
*/
// Functions can declare parameter and return types; closures capture chosen values.
function greet(string $name = "World"): string {
    return "Hello, {$name}!";
}
$greeting = greet();
$double = fn(int $number): int => $number * 2;

/*
    Code Health & Documentation
*/
// PHP supports //, #, block comments, and documentation comments.
// A single-line comment.
# Another line-comment style.
/* A block comment can span
   multiple lines. */
/** Add two integers. */
function add(int $left, int $right): int { return $left + $right; }
$sum = add(2, 3);

/*
    Built-In Collections
*/
// PHP arrays are ordered maps; SPL supplies specialized collection objects.
$colors = ["red", "blue"];
$colors[] = "green";
$inventory = ["apples" => 3];
$lengths = array_map("strlen", $colors);
$queue = new SplQueue();
$queue->enqueue("first");
$first = $queue->dequeue();

/*
    Data Mutability
*/
// Arrays use value semantics with copy-on-write; assigned objects share identity.
$settings = ["theme" => "light"];
$updated = $settings;
$updated["theme"] = "dark";
$person = (object) ["name" => "Ada"];
$alias = $person;
$alias->name = "Grace";

/*
    Access & Encapsulation
*/
// Visibility controls class members; private state can be exposed through methods.
class Counter {
    private int $count = 0;
    public function increment(): void { $this->count++; }
    public function value(): int { return $this->count; }
}
$counter = new Counter();
$counter->increment();

/*
    Design Paradigms & Patterns
*/
// Higher-order functions implement reusable transformations without changing the input.
$prices = [10, 20, 30];
$discounted = array_map(fn(int $price): float => $price * 0.9, $prices);

/*
    Memory Management
*/
// Reference counting and cycle collection manage memory; close external resources explicitly.
$stream = fopen("php://memory", "r+");
if ($stream !== false) {
    try { fwrite($stream, "sample"); }
    finally { fclose($stream); }
}

/*
    Concurrency & Parallelism
*/
// Generators yield values lazily; fibers are cooperative and need scheduling, not automatic parallelism.
function steps(): Generator {
    yield "first";
    yield "second";
}
$steps = iterator_to_array(steps());

/*
    Performance Optimization
*/
// Use keyed lookups for repeated membership checks and profile before caching.
$allowedNames = array_fill_keys(["Ada", "Grace"], true);
$isAllowed = isset($allowedNames["Ada"]);

echo "Hello, World!\n";
