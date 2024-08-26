use strict;
use warnings;

# Define the maximum value
my $max_val = 4000000;

# Initialize the first two terms of the Fibonacci sequence
my $term1 = 1;
my $term2 = 2;
my $sum_even = 0;

# Compute the sum of even Fibonacci numbers
while ($term1 <= $max_val) {
    # Check if the current term is even
    if ($term1 % 2 == 0) {
        $sum_even += $term1;
    }

    # Calculate the next term in the Fibonacci sequence
    my $next_term = $term1 + $term2;
    $term1 = $term2;
    $term2 = $next_term;
}

# Output the result
print "Sum of the even-valued terms: $sum_even\n";