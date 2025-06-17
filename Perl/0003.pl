use strict;
use warnings;

sub largest_prime_factor {
    my ($n) = @_;
    my $max_prime = -1;

    # Step 1: Remove all factors of 2
    while ($n % 2 == 0) {
        $max_prime = 2;
        $n /= 2;
    }

    # Step 2: Try odd factors from 3 upwards
    my $i = 3;
    while ($i * $i <= $n) {
        while ($n % $i == 0) {
            $max_prime = $i;
            $n /= $i;
        }
        $i += 2;
    }

    # Step 3: If n is now greater than 2, then it's a prime
    if ($n > 2) {
        $max_prime = $n;
    }

    return $max_prime;
}

my $number = 600851475143;
my $result = largest_prime_factor($number);
print "The largest prime factor of $number is $result\n";