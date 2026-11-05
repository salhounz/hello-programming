import asyncio
from io import StringIO

#
#    Type Systems & Variables
#
# Names bind to objects; annotations describe intended types without enforcing runtime checks.
score: int = 10
score += 5
language = "Python"
missing = None

#
#    Control Flow Operations
#
# if, for, and comprehensions express decisions and iteration.
status = "pass" if score >= 10 else "retry"
for value in range(3):
    score += value

#
#    Execution Blocks
#
# Indentation defines suites; functions return values and introduce local scope.
def greet(name="World"):
    return f"Hello, {name}!"

greeting = greet()

#
#    Code Health & Documentation
#
# # starts a comment; a function's first string literal is its documentation, not a general comment.
# A single-line comment.
# Continue with another line for a longer note.
def add(left: int, right: int) -> int:
    """Return the sum of two integers."""
    return left + right

assert add(2, 3) == 5

#
#    Built-In Collections
#
# list is ordered and mutable, tuple is immutable, dict maps keys, and set stores unique values.
values = [1, 2, 3]
point = (10, 20)
inventory = {"apples": 3}
unique = {1, 1, 2}
doubled = [value * 2 for value in values]

#
#    Data Mutability
#
# Assignment aliases objects; copy makes a shallow collection copy.
alias = values
copied = values.copy()
copied.append(4)
assert len(alias) == 3

#
#    Access & Encapsulation
#
# A leading underscore signals non-public state; properties expose a managed interface.
class Counter:
    def __init__(self):
        self._count = 0

    def increment(self):
        self._count += 1

    @property
    def value(self):
        return self._count

counter = Counter()
counter.increment()
assert counter.value == 1

#
#    Design Paradigms & Patterns
#
# First-class functions and comprehensions support reusable transformations.
def transform(values, strategy):
    return [strategy(value) for value in values]

assert transform([1, 2], lambda value: value * 2) == [2, 4]

#
#    Memory Management
#
# Automatic memory management handles objects; with closes external resources deterministically.
with StringIO() as stream:
    stream.write("sample")
    stored = stream.getvalue()

#
#    Concurrency & Parallelism
#
# asyncio gathers cooperative asynchronous operations; workers require a separate execution mechanism.
async def load_name(name):
    await asyncio.sleep(0)
    return name

async def load_together():
    return await asyncio.gather(load_name("Ada"), load_name("Grace"))

loaded = asyncio.run(load_together())

#
#    Performance Optimization
#
# Use sets for repeated membership checks and generators to avoid unnecessary intermediate lists.
allowed = {"Ada", "Grace"}
is_allowed = "Ada" in allowed
total = sum(value * 2 for value in values)

print("Hello, World!")
