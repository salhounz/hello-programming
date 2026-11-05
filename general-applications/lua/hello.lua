--[[
    Type Systems & Variables
]]
-- local restricts a name's scope; values have runtime types.
local score = 10
score = score + 5
local language = "Lua"
local missing = nil

--[[
    Control Flow Operations
]]
-- if statements and numeric for loops handle decisions and repetition.
local status
if score >= 10 then status = "pass" else status = "retry" end
for value = 1, 3 do score = score + value end

--[[
    Execution Blocks
]]
-- Functions are values; do/end creates a local block.
local function add(left, right)
  return left + right
end
local sum = add(2, 3)

--[[
    Code Health & Documentation
]]
-- -- starts a line comment; --[[ ... ]] encloses a block.
-- A single-line comment.
--[[
A multi-line comment.
Use long-bracket levels if a delimiter must appear in the text.
]]

--[[
    Built-In Collections
]]
-- Tables hold sequence entries and named keys; ipairs visits consecutive sequence entries.
local values = {1, 2, 3}
local inventory = {apples = 3}
local total = 0
for _, value in ipairs(values) do total = total + value end

--[[
    Data Mutability
]]
-- Assignment aliases a table; copying entries produces a shallow copy.
local copied = {}
for key, value in pairs(values) do copied[key] = value end
copied[1] = 99
assert(values[1] == 1)

--[[
    Access & Encapsulation
]]
-- Closures can expose operations while keeping captured state local.
local function make_counter()
  local count = 0
  return function() count = count + 1; return count end
end
local increment = make_counter()
assert(increment() == 1)

--[[
    Design Paradigms & Patterns
]]
-- First-class functions let callers pass a strategy.
local function transform(items, strategy)
  local result = {}
  for index, value in ipairs(items) do result[index] = strategy(value) end
  return result
end
local doubled = transform(values, function(value) return value * 2 end)

--[[
    Memory Management
]]
-- Garbage collection manages tables; weak-key tables avoid retaining keys by themselves.
local metadata = setmetatable({}, {__mode = "k"})
local owner = {}
metadata[owner] = {visits = 1}

--[[
    Concurrency & Parallelism
]]
-- A coroutine yields cooperatively and resumes on the same scheduling thread.
local task = coroutine.create(function()
  coroutine.yield("first")
  return "second"
end)
local ok, first = coroutine.resume(task)
local finished, second = coroutine.resume(task)
assert(ok and finished)

--[[
    Performance Optimization
]]
-- Accumulate fragments and concatenate once rather than repeatedly copying growing strings.
local fragments = {"Hello", ", ", "World!"}
local message = table.concat(fragments)
assert(message == "Hello, World!")

print("Hello, World!")
