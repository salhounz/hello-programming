/*
    Type Systems & Variables
*/
let score = 10; // Block-scoped; use let for values that will be reassigned.
score += 5;
const language = "JavaScript"; // Block-scoped binding; cannot be reassigned.
var legacyVariable = true; // Function-scoped; common in older JavaScript.

// JavaScript is dynamically typed: a variable can hold different value types.
let dynamicValue = 42;
dynamicValue = "forty-two";
const valueType = typeof dynamicValue; // "string"
const isReady = true; // boolean
const missingValue = undefined; // No value assigned or provided.
const emptyValue = null; // Intentional absence of a value.
const largeInteger = 9007199254740993n; // bigint: exact integer arithmetic.
const uniqueKey = Symbol("id"); // symbol: a unique property key.
const circleRatio = Math.PI; // Built-in objects expose useful constants.


/*
    Control Flow Operations
*/
let result;
if (score >= 10) {
  result = "pass";
} else {
  result = "retry";
}
const statusLabel = isReady ? "ready" : "waiting"; // Ternary expression.
const displayName = emptyValue ?? "Guest"; // Default only for null/undefined.

let action;
switch (result) {
  case "pass":
    action = "continue";
    break; // Prevent falling through to the next case.
  default:
    action = "practice";
}

let total = 0;
for (let index = 0; index < 5; index++) {
  if (index === 1) continue; // Skip this iteration.
  if (index === 4) break; // Exit the loop.
  total += index; // 0 + 2 + 3 = 5
}
let remaining = 2;
while (remaining > 0) {
  remaining--;
}
do {
  remaining++; // A do/while body always runs at least once.
} while (remaining < 1);


/*
    Execution Blocks
*/
{
  const blockMessage = "Accessible only inside these braces";
  const messageLength = blockMessage.length;
}

function greet(name = "World") {
  return `Hello, ${name}!`; // Functions group reusable statements.
}
const double = (number) => number * 2; // Arrow function with an implicit return.
const greeting = greet();
// With the default argument, greeting is the repository's Hello, World! example.
const doubled = double(4); // 8

let parsedValue;
try {
  parsedValue = JSON.parse('{"valid":true}');
} catch (error) {
  parsedValue = { valid: false, message: error.message };
} finally {
  // Runs after try/catch; useful for cleanup on success or failure.
}

/*
    Code Health & Documentation
*/
// A single-line comment explains intent or a useful detail.
/* A block comment can span
   multiple lines. Block comments cannot be nested. */

/**
 * Add two numbers. JSDoc describes parameters and return values for tooling.
 * @param {number} left - First number.
 * @param {number} right - Second number.
 * @returns {number} The sum of both numbers.
 */
function add(left, right) {
  if (typeof left !== "number" || typeof right !== "number") {
    throw new TypeError("Both arguments must be numbers.");
  }
  return left + right;
}
const sum = add(2, 3); // 5; descriptive names and validation help callers.

/*
    Built-In Collections
*/
const colors = ["red", "blue"]; // Array: ordered values, indexed from zero.
colors.push("green");
const firstColor = colors[0]; // "red"
const colorLengths = colors.map((color) => color.length); // [3, 4, 5]
const longColors = colors.filter((color) => color.length > 3); // ["blue", "green"]
for (const color of colors) {
  const uppercaseColor = color.toUpperCase(); // for...of visits values.
}

const person = { name: "Ada", active: true }; // Object: named properties.
const personName = person.name; // "Ada"
const propertyNames = Object.keys(person); // ["name", "active"]

const inventory = new Map(); // Map: key/value entries; keys can be any type.
inventory.set("apples", 3);
const appleCount = inventory.get("apples"); // 3
const inventorySize = inventory.size; // 1

const tags = new Set(["web", "web", "javascript"]); // Set: unique values.
tags.add("learning");
const hasWebTag = tags.has("web"); // true; duplicate "web" was discarded.

const metadata = new WeakMap(); // WeakMap: keys are not kept alive by the map.
const owner = {};
metadata.set(owner, { visits: 1 }); // Object keys are common for metadata.
const visits = metadata.get(owner).visits; // 1

const visited = new WeakSet(); // WeakSet: weak membership, without enumeration.
visited.add(owner);
const hasVisited = visited.has(owner); // true; no size or iteration API.

const bytes = new Uint8Array([0, 128, 255]); // Typed array: fixed-length byte data.
const byteLength = bytes.byteLength; // 3; each element is an unsigned 8-bit value.

/*
    Data Mutability
*/
const settings = { theme: "light", nested: { compact: false } };
settings.theme = "dark"; // const protects the binding; the object stays mutable.
let currentTheme = "light";
currentTheme = "dark"; // Strings are immutable; this assigns a new string value.

const updatedSettings = { ...settings, theme: "blue" }; // Shallow object copy.
const extendedColors = [...colors, "purple"]; // New array; colors stays intact.
const sharesNestedObject = updatedSettings.nested === settings.nested; // true
const independentSettings = structuredClone(settings); // Deep copy of this data.
independentSettings.nested.compact = true; // Does not change settings.nested.
const fixedSettings = Object.freeze({ theme: "dark" }); // Shallow freeze only.
// In strict mode, assigning fixedSettings.theme would throw a TypeError.

/*
    Access & Encapsulation
*/
class Counter {
  #count = 0; // Private field; only code inside this class can access it directly.

  increment() {
    this.#count++;
  }

  get value() {
    return this.#count; // Public getter exposes the value without a setter.
  }
}
const counter = new Counter();
counter.increment();
const count = counter.value; // 1

function createSecretReader(secret) {
  return () => secret; // A closure retains access to its enclosing scope.
}
const readSecret = createSecretReader("hidden in the closure");
const secretValue = readSecret();

/*
    Design Paradigms & Patterns
*/
// Functional style: pure functions return results without changing their inputs.
const prices = [10, 20, 30];
const discountedPrices = prices.map((price) => price * 0.9); // [9, 18, 27]
const priceTotal = prices.reduce((subtotal, price) => subtotal + price, 0); // 60

// Object-oriented style: Counter above combines state and behavior in a class.
// Strategy pattern: pass behavior as a function to choose how work is done.
function transformValues(values, strategy) {
  return values.map(strategy);
}
const doubledPrices = transformValues(prices, double); // [20, 40, 60]

/*
    Memory Management
*/
// Garbage collection reclaims unreachable objects; there is no manual free().
let temporaryData = { contents: new Array(100).fill("sample") };
temporaryData = null; // Remove this reference; collection timing is unspecified.

const cache = new Map([["old-result", { value: 42 }]]);
cache.delete("old-result"); // A long-lived Map keeps entries alive until removed.
cache.clear(); // Release references to all remaining entries.
// WeakMap/WeakSet above avoid keeping their keys/members alive by themselves.
const timer = setTimeout(() => {}, 1000);
clearTimeout(timer); // Explicitly clean up timers when they are no longer needed.

/*
    Concurrency & Parallelism
*/
function delay(milliseconds) {
  return new Promise((resolve) => setTimeout(resolve, milliseconds));
}

async function loadExample(name) {
  await delay(1); // Yield while waiting; this does not block the JavaScript thread.
  return { name, loaded: true };
}

async function loadTogether() {
  const [first, second] = await Promise.all([
    loadExample("first"),
    loadExample("second"),
  ]); // Start both tasks before waiting; results keep the input order.
  return [first, second];
}
const loading = loadTogether().catch((error) => {
  console.error("Loading failed:", error.message); // Handle async rejections.
});
// Promises coordinate concurrent work; CPU parallelism requires worker threads.
// Browsers provide Web Workers; Node.js provides the node:worker_threads module.

/*
    Performance Optimization
*/
const allowedNames = new Set(["Ada", "Grace", "Linus"]);
const isAllowed = allowedNames.has("Ada"); // Reuse a Set for repeated lookups.

const squareCache = new Map();
function memoizedSquare(number) {
  if (squareCache.has(number)) return squareCache.get(number);
  const squared = number * number;
  squareCache.set(number, squared); // Memoization trades memory for reused results.
  return squared;
}
const firstSquare = memoizedSquare(12); // Computes and caches 144.
const cachedSquare = memoizedSquare(12); // Reuses 144; bound long-lived caches.
// Profile real workloads first; caching a trivial calculation is illustrative.
