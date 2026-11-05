# Commands consist of words; set binds values without static declarations.
set owner Ada
set previewLimit 2
set showCompleted false
puts "Tasks for $owner"

# Braces defer substitution; brackets substitute a command's result.
proc label {title {done false}} {
    if {$done} {
        set status done
    } else {
        set status next
    }
    return [format {[%s] %s} $status [string trim $title]]
}

# list keeps spaces inside each title; dict associates named fields.
set tasks [list \
    [dict create title {Read a chapter} done true] \
    [dict create title {Water plants} done false] \
    [dict create title {Plan a walk} done false]]

set pending {}
foreach task $tasks {
    set title [dict get $task title]
    set done [dict get $task done]
    if {!$done} {
        lappend pending $title
    }
    if {$showCompleted || !$done} {
        puts [label $title $done]
    }
}

# lrange has an inclusive final index; expr should normally be braced.
set preview [lrange $pending 0 [expr {$previewLimit - 1}]]
puts "Preview: [join $preview {, }]"
set tags [lsort -unique {home learning home}]
puts "Unique tags: [join $tags {, }]"

set minutes [dict create reading 20 walk 30]
puts "Walk minutes: [dict get $minutes walk]"
if {![dict exists $minutes gardening]} {
    puts {No gardening estimate}
}

# Values behave independently on update, even when storage can be shared.
set extended $pending
lappend extended {Write a note}
puts "Original: [llength $pending]; copy: [llength $extended]"

set input two
if {![string is integer -strict $input]} {
    set input $previewLimit
}
puts "Requested preview size: $input"
