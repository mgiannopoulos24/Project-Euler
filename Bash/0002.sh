#!/bin/bash

# Initialize the first two terms of the Fibonacci sequence
a=1
b=2
sum=0

# Iterate until the terms exceed four million
while [ $a -le 4000000 ]; do
    # Check if the term is even
    if [ $((a % 2)) -eq 0 ]; then
        sum=$((sum + a))
    fi

    # Generate the next Fibonacci number
    next_term=$((a + b))
    a=$b
    b=$next_term
done

# Print the sum of the even-valued terms
echo "The sum of the even-valued terms is: $sum"
