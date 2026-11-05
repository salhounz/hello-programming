#!/usr/bin/env bash

#
#    Type Systems & Variables
#
# Assignments bind shell strings; declare -i adds arithmetic behavior and readonly fixes a name.
score=10
((score += 5))
readonly example_language="Bash"

#
#    Control Flow Operations
#
# [[ ]] tests conditions; for iterates through separately quoted arguments.
if [[ $score -ge 10 ]]; then result=pass; else result=retry; fi
for value in 1 2 3; do ((score += value)); done

#
#    Execution Blocks
#
# Functions use positional parameters; local limits variables to function calls.
add() { local left=$1 right=$2; printf "%s" "$((left + right))"; }
sum=$(add 2 3)

#
#    Code Health & Documentation
#
# # starts a comment; a quoted here-document passed to : can hold a longer ignored note.
# A single-line comment.
: <<'COMMENT'
A multi-line note with no expansion.
This is a no-op command with redirected input, not special comment syntax.
COMMENT

#
#    Built-In Collections
#
# Indexed arrays preserve element order; associative arrays map string keys.
values=(1 2 3)
declare -A inventory=([apples]=3)
first=${values[0]}

#
#    Data Mutability
#
# Array expansion makes a new array; assignments do not create object references.
copied=("${values[@]}")
copied+=(4)

#
#    Access & Encapsulation
#
# Functions and naming conventions organize scope; Bash has no class-level private fields.
example_label() { local label="local value"; printf "%s" "$label"; }
label=$(example_label)

#
#    Design Paradigms & Patterns
#
# Small commands and functions compose through streams and exit codes.
double() { printf "%s" "$(($1 * 2))"; }
doubled=$(double 3)

#
#    Memory Management
#
# The shell manages variables; traps can release resources or state on exit.
example_temporary="sample"
trap 'unset example_temporary' EXIT

#
#    Concurrency & Parallelism
#
# & starts a background process; wait observes its completion and status.
sleep 0.01 &
worker=$!
wait "$worker"

#
#    Performance Optimization
#
# Prefer builtins for simple operations and avoid launching a process per element.
total=0
for value in "${values[@]}"; do ((total += value)); done

printf '%s\n' 'Hello, World!'
