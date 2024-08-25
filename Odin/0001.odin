package main

import "core:fmt"

main :: proc() {
    total_sum := 0;

    // Loop through numbers from 1 to 999
    for i in 1 .. 999 {
        // Check if the number is a multiple of 3 or 5
        if i % 3 == 0 || i % 5 == 0 {
            total_sum += i;
        }
    }

    // Print the result
    fmt.println("The sum of all multiples of 3 or 5 below 1000 is:", total_sum);
}