<?php

function largestPrimeFactor($n) {
    $maxPrime = -1;

    // Step 1: Remove all factors of 2
    while ($n % 2 == 0) {
        $maxPrime = 2;
        $n /= 2;
    }

    // Step 2: Try odd factors from 3 upwards
    for ($i = 3; $i <= sqrt($n); $i += 2) {
        while ($n % $i == 0) {
            $maxPrime = $i;
            $n /= $i;
        }
    }

    // Step 3: If n is now greater than 2, then it's a prime
    if ($n > 2) {
        $maxPrime = $n;
    }

    return $maxPrime;
}

$number = 600851475143;
$result = largestPrimeFactor($number);

echo "The largest prime factor of $number is $result\n";