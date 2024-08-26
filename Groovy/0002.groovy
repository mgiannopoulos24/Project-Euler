// Define the maximum value for the Fibonacci terms
def maxVal = 4000000

// Initialize the first two terms of the Fibonacci sequence
def term1 = 1
def term2 = 2
def sumEven = 0

// Loop to generate Fibonacci numbers and sum the even ones
while (term1 <= maxVal) {
    // Check if the current term is even
    if (term1 % 2 == 0) {
        sumEven += term1
    }

    // Generate the next term in the Fibonacci sequence
    def nextTerm = term1 + term2
    term1 = term2
    term2 = nextTerm
}

// Output the result
println "Sum of the even-valued terms: $sumEven"
