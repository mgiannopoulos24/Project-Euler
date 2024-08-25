package main

import "fmt"

// Function to calculate the sum of multiples of 3 or 5 below a given limit
func sumOfMultiples(limit int) int {
    sum := 0
    for i := 1; i < limit; i++ {
        if i % 3 == 0 || i % 5 == 0 {
            sum += i
        }
    }
    return sum
}

func main() {
    limit := 1000
    result := sumOfMultiples(limit)
    fmt.Printf("The sum of all multiples of 3 or 5 below %d is: %d\n", limit, result)
}
