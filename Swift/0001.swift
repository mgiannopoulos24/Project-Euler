import Foundation

// Function to calculate the sum of multiples of 3 or 5 below a given limit
func sumOfMultiples(below limit: Int) -> Int {
    var totalSum = 0
    for i in 1..<limit {
        if i % 3 == 0 || i % 5 == 0 {
            totalSum += i
        }
    }
    return totalSum
}

// Define the limit
let limit = 1000

// Calculate the result
let result = sumOfMultiples(below: limit)

// Print the result
print("The sum of all multiples of 3 or 5 below \(limit) is: \(result)")
