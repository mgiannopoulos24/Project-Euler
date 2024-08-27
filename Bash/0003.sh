#!/bin/bash

# The number for which we want to find the largest prime factor
number=600851475143

# Start with the smallest prime number
factor=2

# Loop to find the smallest prime factor
while (( number > 1 )); do
  if (( number % factor == 0 )); then
    # If 'factor' divides 'number', divide number by 'factor' to reduce it
    (( number /= factor ))
  else
    # If 'factor' does not divide 'number', move to the next possible factor
    (( factor++ ))
  fi
done

# The largest prime factor will be in 'factor' when the loop ends
echo "The largest prime factor is: $factor"
