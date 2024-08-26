object FibonacciSum {
  def sumEvenFibonacci(limit: Int): Int = {
    var a = 1
    var b = 2
    var evenSum = 0

    while (a <= limit) {
      if (a % 2 == 0) {
        evenSum += a
      }
      val next = a + b
      a = b
      b = next
    }

    evenSum
  }

  def main(args: Array[String]): Unit = {
    // Define the limit (4 million)
    val limit = 4000000

    // Calculate the sum of even-valued Fibonacci numbers
    val result = sumEvenFibonacci(limit)

    // Print the result
    println(s"The sum of the even-valued terms is: $result")
  }
}
