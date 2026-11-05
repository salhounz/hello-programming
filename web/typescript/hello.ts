export {};

/*
    Type Systems & Variables
*/
// let permits reassignment; const fixes a binding, and annotations constrain accepted values.
let score: number = 10;
score += 5;
const language: string = "TypeScript";
let identifier: string | number = 42;
identifier = "item-42";

/*
    Control Flow Operations
*/
// Narrow union types before performing type-specific operations.
const label = typeof identifier === "string" ? identifier.toUpperCase() : identifier.toFixed(0);
for (let index = 0; index < 3; index++) {
  score += index;
}

/*
    Execution Blocks
*/
// Functions declare input and output types; blocks limit local bindings.
function greet(name: string = "World"): string {
  return `Hello, ${name}!`;
}
const greeting = greet();

/*
    Code Health & Documentation
*/
// Use line comments, block comments, and JSDoc to explain contracts.
// A single-line comment.
/* A block comment can span
   several lines. */
/** Return the sum of two numbers. */
function add(left: number, right: number): number {
  return left + right;
}
const sum = add(2, 3);

/*
    Built-In Collections
*/
// Arrays are ordered; Map stores typed key/value pairs and Set removes duplicates.
const values: number[] = [1, 2, 3];
const doubled = values.map((value) => value * 2);
const inventory = new Map<string, number>([["apples", 3]]);
const tags = new Set<string>(["web", "web"]);

/*
    Data Mutability
*/
// readonly prevents writes through that type; spread copies only one level.
const settings: Readonly<{ theme: string }> = { theme: "light" };
const updatedSettings = { ...settings, theme: "dark" };
const frozenSettings = Object.freeze({ theme: "dark" });

/*
    Access & Encapsulation
*/
// Private fields hide state; public getters can expose read-only access.
class Counter {
  #count = 0;
  increment(): void { this.#count++; }
  get value(): number { return this.#count; }
}
const counter = new Counter();
counter.increment();

/*
    Design Paradigms & Patterns
*/
// Interfaces describe shape; generics retain the relationship between inputs and outputs.
interface Named { name: string; }
function first<T>(items: readonly T[]): T | undefined {
  return items[0];
}
const person: Named = { name: "Ada" };
const firstValue = first(values);

/*
    Memory Management
*/
// JavaScript garbage collection handles objects; WeakMap does not retain its keys.
const owner = {};
const metadata = new WeakMap<object, { visits: number }>();
metadata.set(owner, { visits: 1 });
const cache = new Map<string, number>();
cache.clear();

/*
    Concurrency & Parallelism
*/
// Promises coordinate asynchronous work; they do not create CPU worker threads.
async function loadTogether(): Promise<string[]> {
  return Promise.all([Promise.resolve("first"), Promise.resolve("second")]);
}
const loading = loadTogether().catch((error: unknown) => {
  if (error instanceof Error) console.error(error.message);
  return [];
});

/*
    Performance Optimization
*/
// Reuse lookup structures; measure before adding caches or complex abstractions.
const allowed = new Set(["Ada", "Grace"]);
const isAllowed = allowed.has("Ada");
const total = values.reduce((subtotal, value) => subtotal + value, 0);

console.log("Hello, World!");
