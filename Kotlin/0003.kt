fun main() {
    val number = 600851475143L
    var n = number
    var largestFactor = -1L

    // Check divisibility by 2
    while (n % 2 == 0L) {
        largestFactor = 2
        n /= 2
    }

    // Check for odd factors from 3 upwards
    var i = 3L
    val sqrtN = Math.sqrt(n.toDouble())
    while (i <= sqrtN) {
        while (n % i == 0L) {
            largestFactor = i
            n /= i
        }
        i += 2
    }

    // If n is still greater than 2, then it is a prime number
    if (n > 2) {
        largestFactor = n
    }

    println("The largest prime factor of $number is $largestFactor")
}