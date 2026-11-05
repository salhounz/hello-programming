#
#    Type Systems & Variables
#
# set stores list-valued variables; math performs numeric evaluation.
set -l score 10
set score (math $score + 5)
set -l example_language Fish

#
#    Control Flow Operations
#
# if uses command exit status; for iterates through list elements.
if test $score -ge 10
    set result pass
else
    set result retry
end
for value in 1 2 3
    set score (math $score + $value)
end

#
#    Execution Blocks
#
# Functions take arguments through argv and can declare local state.
function example_add
    math $argv[1] + $argv[2]
end
set -l sum (example_add 2 3)

#
#    Code Health & Documentation
#
# Fish uses # line comments; use adjacent lines for multi-line documentation.
# A single-line comment.
# A second line describes the command contract.

#
#    Built-In Collections
#
# Variables can hold lists; Fish has no native general-purpose hash-map type.
set -l values 1 2 3
set -l first $values[1]
set -l count (count $values)

#
#    Data Mutability
#
# Copy list elements into another variable before making independent updates.
set -l copied $values
set -a copied 4

#
#    Access & Encapsulation
#
# Function-local variables reduce collisions; functions do not provide private object fields.
function example_label
    set -l label "local value"
    printf "%s" "$label"
end
set -l label (example_label)

#
#    Design Paradigms & Patterns
#
# Small functions compose through output and command exit status.
function example_double
    math $argv[1] * 2
end
set -l doubled (example_double 3)

#
#    Memory Management
#
# set -e removes a variable; resource cleanup belongs to the script that creates it.
set -l temporary sample
set -e temporary

#
#    Concurrency & Parallelism
#
# & starts background work; wait observes all or selected child jobs.
sleep 0.01 &
wait

#
#    Performance Optimization
#
# Use list operations and builtins when they avoid unnecessary process creation.
set -l has_two no
if contains -- 2 $values
    set has_two yes
end

printf '%s\n' 'Hello, World!'
