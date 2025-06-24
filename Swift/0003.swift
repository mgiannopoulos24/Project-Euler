import Foundation

func largestPrimeFactor(of number: Int64) -> Int64 {
    var n = number
    var maxPrime: Int64 = -1

    // Step 1: Remove all factors of 2
    while n % 2 == 0 {
        maxPrime = 2
        n /= 2
    }

    // Step 2: Try odd factors from 3 upwards
    var i: Int64 = 3
    while i * i <= n {
        while n % i == 0 {
            maxPrime = i
            n /= i
        }
        i += 2
    }

    // Step 3: If remaining n is greater than 2, it's a prime
    if n > 2 {
        maxPrime = n
    }

    return maxPrime
}

let number: Int64 = 600851475143
let result = largestPrimeFactor(of: number)
print("The largest prime factor of \(number) is \(result)")