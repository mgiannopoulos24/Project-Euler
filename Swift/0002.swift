import Foundation

func sumEvenFibonacci(limit: Int) -> Int {
    var a = 1
    var b = 2
    var evenSum = 0

    while a <= limit {
        if a % 2 == 0 {
            evenSum += a
        }
        let next = a + b
        a = b
        b = next
    }

    return evenSum
}

// Define the limit (4 million)
let limit = 4_000_000

// Calculate the sum of even-valued Fibonacci numbers
let result = sumEvenFibonacci(limit: limit)

// Print the result
print("The sum of the even-valued terms is: \(result)")
