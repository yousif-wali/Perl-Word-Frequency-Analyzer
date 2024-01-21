#!/usr/bin/perl
use strict;
use warnings;

# Word Frequency Counter

# Checks if a file name is provided
my $filename = shift or die "Usage: $0 filename\n";

# Open the file
open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";

# Hash to store word counts
my %frequency;

# Process the file
while (my $line = <$fh>) {
    chomp $line;
    my @words = split(/\s+/, $line);
    foreach my $word (@words) {
        $word = lc($word); # Convert to lowercase
        $word =~ s/[[:punct:]]//g; # Remove punctuation
        $frequency{$word}++;
    }
}

# Close the file
close($fh);

# Output the frequency of each word
foreach my $word (sort { $frequency{$b} <=> $frequency{$a} } keys %frequency) {
    print "$word: $frequency{$word}\n";
}
