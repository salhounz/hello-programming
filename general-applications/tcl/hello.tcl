#
#    Type Systems & Variables
#
# set assigns a value; Tcl values have string representations and internal typed forms.
set score 10
incr score 5
set language Tcl

#
#    Control Flow Operations
#
# if and foreach evaluate braced bodies and expressions.
if {$score >= 10} { set status pass } else { set status retry }
foreach value {1 2 3} { incr score $value }

#
#    Execution Blocks
#
# proc declares a reusable command with local variables.
proc add {left right} {
    return [expr {$left + $right}]
}
set sum [add 2 3]

#
#    Code Health & Documentation
#
# Use # at the start of a command; adjacent comment lines document longer explanations.
# A single-line comment.
# A second line continues the explanation.
# Tcl has no dedicated block-comment delimiter.

#
#    Built-In Collections
#
# Lists preserve element boundaries and dictionaries map keys to values.
set values [list 1 2 3]
set inventory [dict create apples 3]
set first [lindex $values 0]

#
#    Data Mutability
#
# Value assignments preserve independent updates through copy-on-write semantics.
set copied $values
lappend copied 4
set settings [dict create theme light]
dict set settings theme dark

#
#    Access & Encapsulation
#
# Namespaces organize commands and variables; exports define the intended public interface.
namespace eval Counter {
    variable count 0
    namespace export increment
    proc increment {} { variable count; incr count }
}
set count [Counter::increment]

#
#    Design Paradigms & Patterns
#
# Procedures and list operations support composable data transformations.
proc double {value} { expr {$value * 2} }
set doubled [lmap value $values { double $value }]

#
#    Memory Management
#
# Values are managed automatically; unset releases a name's reference to a value.
set temporary [list sample data]
unset temporary

#
#    Concurrency & Parallelism
#
# after schedules a callback; vwait processes events until the named variable changes.
after 1 { set ::exampleDone 1 }
vwait ::exampleDone
unset ::exampleDone

#
#    Performance Optimization
#
# Use lappend to grow a list and dict for keyed lookup rather than constructing script text.
set batch {}
for {set index 0} {$index < 10} {incr index} { lappend batch $index }

puts "Hello, World!"
