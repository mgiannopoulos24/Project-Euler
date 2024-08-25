fun sumOfMultiples(limit: Int): Int {
    return (1 until limit)
        .filter { it % 3 == 0 || it % 5 == 0 }
        .sum()
}

fun main() {
    val limit = 1000
    val result = sumOfMultiples(limit)
    println("The sum of all multiples of 3 or 5 below $limit is: $result")
}
