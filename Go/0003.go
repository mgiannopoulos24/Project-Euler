package main

import (
    "fmt"
)

// Function to find the largest prime factor
func largestPrimeFactor(n int64) int64 {
    var largest int64 = 0

    // Remove all factors of 2
    for n%2 == 0 {
        largest = 2
        n /= 2
    }

    // Check for odd factors up to sqrt(n)
    for i := int64(3); i*i <= n; i += 2 {
        for n%i == 0 {
            largest = i
            n /= i
        }
    }

    // If remaining n is a prime number > 2
    if n > 2 {
        largest = n
    }

    return largest
}

func main() {
    number := int64(600851475143)
    result := largestPrimeFactor(number)
    fmt.Printf("The largest prime factor of %d is %d\n", number, result)
}