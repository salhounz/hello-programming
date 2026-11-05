use strict;
use warnings;

# Scalars hold single values; lexical my names stay within their scope.
my $owner = 'Ada';
my $preview_limit = 2;
my $show_completed = 0;
my $nickname = undef;
print 'Tasks for ', ($nickname // $owner), "\n";

# Subroutines receive a list of arguments through @_.
sub label {
    my ($title, $done) = @_;
    my $status = $done ? 'done' : 'next';
    return "[$status] $title";
}

# An array of hash references represents ordered records.
my @tasks = (
    { title => 'Read a chapter', done => 1 },
    { title => 'Water plants', done => 0 },
    { title => 'Plan a walk', done => 0 },
);

foreach my $task (@tasks) {
    next if $task->{done} && !$show_completed;
    print label($task->{title}, $task->{done}), "\n";
}

# grep filters records; map extracts their titles using the current $_.
my @pending = map { $_->{title} } grep { !$_->{done} } @tasks;
my @preview;
foreach my $title (@pending) {
    last if @preview >= $preview_limit;
    push @preview, $title;
}
print 'Preview: ', join(', ', @preview), "\n";

# Hash keys are unique; sort provides deterministic display order.
my %tags = map { $_ => 1 } ('home', 'learning', 'home');
print 'Tags: ', join(', ', sort keys %tags), "\n";
my %minutes = (reading => 20, walk => 30);
print "Walk minutes: $minutes{walk}\n";

# Copying an array of strings separates membership; a reference aliases it.
my @extended = @pending;
push @extended, 'Write a note';
print 'Original: ', scalar(@pending), '; copy: ', scalar(@extended), "\n";

# A regex validates the whole string before numeric conversion.
my $input = 'two';
my $requested = $input =~ /\A[0-9]+\z/ ? int($input) : $preview_limit;
print "Requested preview size: $requested\n";
print "Missing estimate\n" unless exists $minutes{gardening};
