fun main() {
    val maxVal = 4000000

    var term1 = 1
    var term2 = 2
    var sumEven = 0

    while (term1 <= maxVal) {
        // Check if the current term is even
        if (term1 % 2 == 0) {
            sumEven += term1
        }

        // Generate the next term in the Fibonacci sequence
        val nextTerm = term1 + term2
        term1 = term2
        term2 = nextTerm
    }

    // Output the result
    println("Sum of the even-valued terms: $sumEven")
}
