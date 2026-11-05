#!/usr/bin/env fish
# Fish variables are lists of strings; indexes begin at one.
set -l title 'Launch checklist'
set -l tasks 'Read the guide' 'Build a sample' 'Share notes'
set -l finished 'Read the guide'

# Named arguments avoid relying on a caller's local variables.
function print_task --argument-names name state
    set -l marker ' '
    if test "$state" = done
        set marker x
    end
    printf '[%s] %s\n' "$marker" "$name"
end

function is_done --argument-names name
    # Remaining arguments are separate completed names, including spaces.
    contains -- "$name" $argv[2..-1]
end

set -a finished 'Build a sample'
printf '%s\n' "$title"
for task in $tasks
    set -l state pending
    if is_done "$task" $finished
        set state done
    end
    print_task "$task" "$state"
end
printf 'Completed: %d/%d\n' (count $finished) (count $tasks)

# List expansion keeps each element intact without POSIX word splitting.
printf 'First task: %s\n' "$tasks[1]"
set -l draft $tasks
set -a draft 'Review feedback'
printf 'Original tasks: %d; draft tasks: %d\n' (count $tasks) (count $draft)

# string subcommands handle common text operations inside the shell.
set -l filename 'launch-notes.txt'
set -l stem (string replace -r '\.txt$' '' -- "$filename")
printf 'Report label: %s\n' "$stem"

switch (count $finished)
    case 0
        printf '%s\n' 'Start with the guide'
    case 3
        printf '%s\n' 'Ready to launch'
    case '*'
        printf '%s\n' 'Keep going'
end

# No persistent universal variables or filesystem changes are needed.
