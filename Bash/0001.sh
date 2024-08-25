#!/bin/bash

sum=0

for ((i=1; i<1000; i++)); do
    if ((i % 3 == 0 || i % 5 == 0)); then
        ((sum += i))
    fi
done

echo "The sum of all multiples of 3 or 5 below 1000 is: $sum"
