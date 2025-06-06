#!/bin/bash

# Function to check if a number is a palindrome
is_palindrome() {
    local num=$1
    # Reverse the number
    local reverse=$(echo "$num" | rev)
    # Check if the number equals its reverse
    [ "$num" == "$reverse" ]
}

# Initialize variables
largest_palindrome=0

# Iterate over all pairs of 3-digit numbers, starting from the largest
for ((i=999; i>=100; i--)); do
    for ((j=i; j>=100; j--)); do
        # Calculate the product
        product=$((i * j))
        
        # If the product is smaller than the largest palindrome, break early
        if ((product <= largest_palindrome)); then
            break
        fi
        
        # Check if the product is a palindrome
        if is_palindrome "$product"; then
            # Update the largest palindrome
            largest_palindrome=$product
        fi
    done
done

# Output the largest palindrome
echo "The largest palindrome made from the product of two 3-digit numbers is: $largest_palindrome"