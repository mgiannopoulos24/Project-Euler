package main

import (
    "fmt"
)

func main() {
    const maxVal = 4000000

    // Initialize the first two terms of the Fibonacci sequence
    term1, term2 := 1, 2
    sumEven := 0

    // Loop to generate Fibonacci numbers and sum the even ones
    for term1 <= maxVal {
        // Check if the current term is even
        if term1 % 2 == 0 {
            sumEven += term1
        }

        // Generate the next term in the Fibonacci sequence
        nextTerm := term1 + term2
        term1 = term2
        term2 = nextTerm
    }

    // Output the result
    fmt.Printf("Sum of the even-valued terms: %d\n", sumEven)
}
