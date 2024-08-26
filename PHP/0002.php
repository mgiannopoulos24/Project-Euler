<?php

// Initialize the first two Fibonacci numbers
$term1 = 1;
$term2 = 2;
$sum = 0;

// Loop to generate Fibonacci sequence terms
while ($term2 <= 4000000) {
    // Check if the term is even
    if ($term2 % 2 == 0) {
        // Add the even term to the sum
        $sum += $term2;
    }

    // Generate the next term in the sequence
    $nextTerm = $term1 + $term2;
    $term1 = $term2;
    $term2 = $nextTerm;
}

// Output the sum of even-valued terms
echo "The sum of the even-valued terms is: " . $sum . "\n";

?>
