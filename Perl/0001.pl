use strict;
use warnings;

# Function to calculate the sum of multiples of 3 or 5 below a given limit
sub sum_of_multiples {
    my ($limit) = @_;
    my $sum = 0;

    for (my $i = 1; $i < $limit; $i++) {
        if ($i % 3 == 0 || $i % 5 == 0) {
            $sum += $i;
        }
    }

    return $sum;
}

# Define the limit
my $limit = 1000;

# Calculate the result
my $result = sum_of_multiples($limit);

# Print the result
print "The sum of all multiples of 3 or 5 below $limit is: $result\n";