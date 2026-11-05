# Run: julia examples.jl
# No external packages or input files are required.

# 1. Comments: # starts a line comment.
#= Block comments can span lines.
   They can also contain nested #= comments =#.
=#

# 2. Values and types: Julia infers types; typeof reveals them.
count = 3                    # Int (native-width signed integer)
temperature = 21.5           # Float64
ready = true                # Bool
initial = 'J'               # Char: single quotes
language = "Julia"          # String: double quotes
exact_fraction = 1 // 3      # Rational, not an approximate decimal
unavailable = missing       # Missing data
no_result = nothing         # Absence of a result; different from missing
println("Types: ", typeof(count), ", ", typeof(initial), ", ", typeof(language))

# 3. Collections and indexing: ordinary arrays use one-based indices.
scores = [72, 85, 91]
push!(scores, 88)            # ! conventionally signals a mutating function
first_score = scores[1]
snapshot = copy(scores)     # A shallow copy; assignment alone aliases an array
person = (name="Ada", active=true)  # Named tuple
stock = Dict("apples" => 3, "pears" => 5)
println("First score: ", first_score, "; person: ", person.name)

# 4. Functions: a final expression is returned implicitly.
function greet(name::AbstractString)
    "Hello, $name!"          # String interpolation
end
println(greet("Ada"))

# Methods can specialize on argument types (multiple dispatch).
describe(value::Number) = "A numeric measurement"
describe(value::AbstractString) = "A text label"
println(describe(temperature), "; ", describe(language))

# 5. Control flow and comprehensions.
if ready
    println("Ready to analyze measurements")
end
for label in ("baseline", "follow-up")
    println("Visit: ", label)
end
passing = [score for score in scores if score >= 80]
println("Passing scores: ", passing)

# 6. Broadcasting: a dot applies a function element by element.
readings = [2.25, 4.0, 6.25]
println("Square roots: ", sqrt.(readings))
println("Known readings: ", collect(skipmissing([21.5, missing, 22.0])))
