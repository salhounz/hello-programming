use strict;
use warnings;

#
#    Type Systems & Variables
#
# Sigils distinguish scalars, arrays, and hashes; my limits a variable to lexical scope.
my $score = 10;
$score += 5;
my $language = "Perl";
my $missing = undef;

#
#    Control Flow Operations
#
# if, foreach, next, and last control execution.
my $status = $score >= 10 ? "pass" : "retry";
foreach my $value (1 .. 3) { $score += $value; }

#
#    Execution Blocks
#
# Subroutines receive arguments through @_; lexical blocks limit local names.
sub add {
    my ($left, $right) = @_;
    return $left + $right;
}
my $sum = add(2, 3);

#
#    Code Health & Documentation
#
# # comments explain code; POD documents larger interfaces and is not a nested block-comment syntax.
# A single-line comment.
# Multiple lines can explain intent.
=pod

This script demonstrates language essentials.

=cut

#
#    Built-In Collections
#
# Arrays are ordered sequences; hashes associate string keys with scalar values.
my @values = (1, 2, 3);
my %inventory = (apples => 3);
my @doubled = map { $_ * 2 } @values;

#
#    Data Mutability
#
# Copying an array copies its elements; a reference shares the existing array.
my @copied = @values;
push @copied, 4;
my $alias = \@values;
my $first = $alias->[0];

#
#    Access & Encapsulation
#
# Closures can hide lexical state without exporting a mutable variable.
sub make_counter {
    my $count = 0;
    return sub { ++$count };
}
my $increment = make_counter();
my $count = $increment->();

#
#    Design Paradigms & Patterns
#
# map, grep, and coderefs support reusable transformations and filters.
my @selected = grep { $_ > 1 } @values;
my $double = sub { $_[0] * 2 };
my $doubled_value = $double->(3);

#
#    Memory Management
#
# Reference counting manages ordinary values; close handles external resources.
my $text = "sample";
open my $stream, "<", \$text or die "Cannot open scalar stream: $!";
my $line = <$stream>;
close $stream or die "Cannot close stream: $!";

#
#    Concurrency & Parallelism
#
# Calling a callback is synchronous; actual concurrency needs processes, threads, or an event loop.
my $callback = sub { return 42 };
my $answer = $callback->();
# A callback alone does not start background work.

#
#    Performance Optimization
#
# Hash lookups avoid repeated scans for string membership; profile before optimizing.
my %allowed = map { $_ => 1 } ("Ada", "Grace");
my $is_allowed = exists $allowed{"Ada"};

print "Hello, World!\n";
