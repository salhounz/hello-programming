-- Lua values carry types; local names are scoped to their block.
local owner = "Ada"
local preview_limit = 2
local show_completed = false
local nickname = nil
print("Tasks for " .. (nickname or owner))

-- Functions are values; omitted arguments arrive as nil.
local function label(title, done)
    local status = done and "done" or "next"
    return string.format("[%s] %s", status, title)
end

-- Tables represent both sequences and records.
local tasks = {
    {title = "Read a chapter", done = true},
    {title = "Water plants", done = false},
    {title = "Plan a walk", done = false},
}

local pending = {}
for _, task in ipairs(tasks) do
    if not task.done then
        table.insert(pending, task.title)
    end
    if show_completed or not task.done then
        print(label(task.title, task.done))
    end
end

-- Sequence indices start at one; # measures this dense sequence.
local preview = {}
for index = 1, math.min(preview_limit, #pending) do
    preview[index] = pending[index]
end
print("Preview: " .. table.concat(preview, ", "))

-- A table with boolean values works as a membership set.
local tags = {home = true, learning = true}
print("Has home tag:", tags.home == true)
local minutes = {reading = 20, walk = 30}
print("Walk minutes:", minutes.walk)

-- Assignment shares a table; an explicit shallow copy separates entries.
local extended = {}
for index, title in ipairs(pending) do
    extended[index] = title
end
table.insert(extended, "Write a note")
print("Original:", #pending, "copy:", #extended)

-- Only nil and false are falsey: even zero and empty strings are truthy.
local requested = tonumber("two") or preview_limit
print("Requested preview size:", requested)
print("Type of pending:", type(pending))
