#!/usr/bin/env zsh
# Use native Zsh defaults even if the user's startup options differ.
emulate -R zsh
setopt nounset

typeset -r title='Launch checklist'
tasks=('Read the guide' 'Build a sample' 'Share notes')
typeset -A states
states=(
    'Read the guide' done
    'Build a sample' pending
    'Share notes' pending
)

print_task() {
    local name=$1 state=$2 marker=' '
    if [[ $state == done ]]; then
        marker=x
    fi
    printf '[%s] %s\n' "$marker" "$name"
}

is_done() {
    [[ $1 == done ]]
}

task_to_finish='Build a sample'
states[$task_to_finish]=done
printf '%s\n' "$title"
integer completed=0
for task in "${tasks[@]}"; do
    state=${states[$task]}
    print_task "$task" "$state"
    if is_done "$state"; then
        ((completed += 1))
    fi
done
printf 'Completed: %d/%d\n' "$completed" "${#tasks[@]}"

# Native indexed arrays start at one; quoted expansion preserves spaces.
printf 'First task: %s\n' "${tasks[1]}"
draft=("${tasks[@]}")
draft+=('Review feedback')
printf 'Draft tasks: %d\n' "${#draft[@]}"

# The :r modifier removes a filename extension without an external tool.
filename='launch-notes.txt'
printf 'Report label: %s\n' "${filename:r}"
case $completed in
    0) print -r -- 'Start with the guide' ;;
    3) print -r -- 'Ready to launch' ;;
    *) print -r -- 'Keep going' ;;
esac
