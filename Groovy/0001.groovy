// Initialize sum to 0
int sum = 0

// Loop through all numbers from 1 to 999
(1..<1000).each { i ->
    // Check if the number is a multiple of 3 or 5
    if (i % 3 == 0 || i % 5 == 0) {
        sum += i
    }
}

// Print the result
println "The sum of all multiples of 3 or 5 below 1000 is: $sum"
