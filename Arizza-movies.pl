#!/usr/bin/perl
use warnings;

=begin
Arizza Santos
CS451 ASN9
I picked this language because it is VERY similar to my own pet language;
infact, my pet language (Ruby) was influenced by Perl. I am curious as to how
Perl differs to Ruby and why Matz Matsumoto did not like this language. He said
that perl has the "smell of a 'toy lanugage'", which is a "computer programming
language that is not considered to be suitable or capable for building general
purpose and high-end software and applications".
=cut

# purpose: reads in the file and puts each line into an array
# input: nothing
# returns: array of movies
sub process_file
{
    my @movies;
    open(my $fh, "<", "./Movies.txt") or die "Can't open < Movies.txt: $!";

    while (my $line = <$fh>)
    {
        chomp $line;
        push @movies, $line;
    }

    close $fh;
    return @movies;
}

sub main
{
    my @movies_array = process_file();
    
}

main();
