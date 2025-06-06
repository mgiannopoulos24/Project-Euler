#!/bin/bash

# Function to compute GCD using Euclidean algorithm
gcd() {
    local a=$1
    local b=$2
    while [ $b -ne 0 ]; do
        local temp=$b
        b=$((a % b))
        a=$temp
    done
    echo $a
}

# Function to compute LCM of two numbers
lcm() {
    local a=$1
    local b=$2
    local gcd_val=$(gcd $a $b)
    echo $((a * b / gcd_val))
}

# Start with LCM = 1
result=1

# Iterate through numbers from 2 to 20 and update LCM
for i in {2..20}; do
    result=$(lcm $result $i)
done

echo "The smallest positive number divisible by all numbers from 1 to 20 is:"
echo $result