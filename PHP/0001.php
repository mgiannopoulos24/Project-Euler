<?php
// Function to calculate the sum of multiples of 3 or 5 below a given limit
function sum_of_multiples($limit) {
    $sum = 0;

    for ($i = 1; $i < $limit; $i++) {
        if ($i % 3 == 0 || $i % 5 == 0) {
            $sum += $i;
        }
    }

    return $sum;
}

// Define the limit
$limit = 1000;

// Calculate the result
$result = sum_of_multiples($limit);

// Print the result
echo "The sum of all multiples of 3 or 5 below $limit is: $result\n";
?>
