#!/usr/bin/perl
use warnings;

=begin
Arizza Santos
CS451 ASN9
I picked this language because it is very similar to my own pet language;
infact, my pet language (Ruby) was influenced by Perl. I am curious as to how
Perl differs to Ruby and why Matz Matsumoto did not like this language. He said
that perl has the "smell of a 'toy lanugage'", which is a "computer programming
language that is not considered to be suitable or capable for building general
purpose and high-end software and applications".
=cut

# purpose: run program to find the movie with the highest profit
# input: nothing
# return: nothin - prints movie with highest profit
sub main
{
    my $profit = 0;
    my $movie;

    open(my $fh, "<", "./Movies.txt") or die "Can't open < Movies.txt: $!";

    foreach my $line (<$fh>)
    {
        chomp $line;
        my @info = split(/:/, $line);         

        my $movie_budget = $info[-2]; 
        my $box_office_gross = $info[-1];
        my $movie_profit = $box_office_gross - $movie_budget;
        
        # determine the highest profit
        if ($movie_profit > $profit)
        {
            $profit = $movie_profit;
        
            # note: some movies have ":" in their titles
            if (scalar @info == 4)
            {
                my @movie_title = @info[0, 1];
                $movie = join(':', @movie_title);
            }
            else
            {
                $movie = $info[0];
            }
        }                
    }

    print("$movie made the highest profit. The profit was \$$profit.\n");

    close $fh;
}

main();
