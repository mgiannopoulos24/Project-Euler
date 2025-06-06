#!/bin/bash

n=100

# Calculate the sum of squares using the formula: n(n + 1)(2n + 1) / 6
sum_of_squares=$(( n * (n + 1) * (2 * n + 1) / 6 ))

# Calculate the sum of the first n natural numbers using the formula: n(n + 1) / 2
sum=$(( n * (n + 1) / 2 ))

square_of_sum=$(( sum * sum ))

difference=$(( square_of_sum - sum_of_squares ))

echo "Sum of the squares of the first $n natural numbers: $sum_of_squares"
echo "Square of the sum of the first $n natural numbers: $square_of_sum"
echo "Difference: $difference"