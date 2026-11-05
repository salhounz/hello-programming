#!/usr/bin/env zsh

#
#    Type Systems & Variables
#
# typeset declares parameters; integer values support arithmetic expressions.
integer score=10
((score += 5))
typeset -r example_language="Zsh"

#
#    Control Flow Operations
#
# Conditions and for loops control execution using Zsh syntax.
if [[ $score -ge 10 ]]; then result=pass; else result=retry; fi
for value in 1 2 3; do ((score += value)); done

#
#    Execution Blocks
#
# Functions and local parameters group behavior and restrict temporary names.
add() { local left=$1 right=$2; printf "%s" "$((left + right))"; }
sum=$(add 2 3)

#
#    Code Health & Documentation
#
# Use # comments and adjacent lines for longer explanations.
# A single-line comment.
# Another line explains the intended expansion rules.

#
#    Built-In Collections
#
# Indexed arrays normally begin at one; associative arrays use string keys.
values=(1 2 3)
typeset -A inventory
inventory[apples]=3
first=${values[1]}

#
#    Data Mutability
#
# Construct a new array from elements when an independent array value is needed.
copied=("${values[@]}")
copied+=(4)

#
#    Access & Encapsulation
#
# Function-local parameters reduce collisions; naming conventions identify public shell helpers.
example_label() { local label="local value"; printf "%s" "$label"; }
label=$(example_label)

#
#    Design Paradigms & Patterns
#
# Compose small functions with explicit output and status conventions.
double() { printf "%s" "$(($1 * 2))"; }
doubled=$(double 3)

#
#    Memory Management
#
# unset releases shell parameters; exit traps can clean up longer-lived resources.
example_temporary="sample"
trap 'unset example_temporary' EXIT

#
#    Concurrency & Parallelism
#
# Background jobs are separate processes; wait synchronizes their completion.
sleep 0.01 &
worker=$!
wait "$worker"

#
#    Performance Optimization
#
# Use shell arithmetic for small numeric work rather than spawning external commands.
integer total=0
for value in "${values[@]}"; do ((total += value)); done

printf '%s\n' 'Hello, World!'
