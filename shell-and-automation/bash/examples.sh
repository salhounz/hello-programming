#!/usr/bin/env bash
# Bash 4+: all data is local; this script changes no files.
set -u

# Shell values are strings; arrays preserve names containing spaces.
readonly title='Launch checklist'
tasks=('Read the guide' 'Build a sample' 'Share notes')
declare -A states=(
    ['Read the guide']=done
    ['Build a sample']=pending
    ['Share notes']=pending
)

print_task() {
    local name=$1 state=$2 marker=' '
    if [[ $state == done ]]; then
        marker=x
    fi
    printf '[%s] %s\n' "$marker" "$name"
}

# Return status communicates a decision; stdout carries display text.
is_done() {
    [[ $1 == done ]]
}

states['Build a sample']=done
printf '%s\n' "$title"
declare -i completed=0
for task in "${tasks[@]}"; do
    state=${states[$task]}
    print_task "$task" "$state"
    if is_done "$state"; then
        ((completed += 1))
    fi
done
printf 'Completed: %d/%d\n' "$completed" "${#tasks[@]}"

# Parameter expansion transforms text without starting another process.
filename='launch-notes.txt'
stem=${filename%.txt}
printf 'Report label: %s\n' "$stem"

# Copying array elements creates an independent list.
draft=("${tasks[@]}")
draft+=('Review feedback')
printf 'Original tasks: %d; draft tasks: %d\n' "${#tasks[@]}" "${#draft[@]}"

case $completed in
    0) printf '%s\n' 'Start with the guide' ;;
    3) printf '%s\n' 'Ready to launch' ;;
    *) printf '%s\n' 'Keep going' ;;
esac
