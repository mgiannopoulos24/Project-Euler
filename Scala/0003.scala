object LargestPrimeFactor extends App {
  def largestPrimeFactor(n: Long): Long = {
    var num = n
    var maxFactor = -1L

    // Step 1: Remove all factors of 2
    while (num % 2 == 0) {
      maxFactor = 2
      num /= 2
    }

    // Step 2: Try odd factors from 3 upwards
    var i = 3L
    while (i * i <= num) {
      while (num % i == 0) {
        maxFactor = i
        num /= i
      }
      i += 2
    }

    // Step 3: If what's left is greater than 2, it's a prime
    if (num > 2) maxFactor = num

    maxFactor
  }

  val number = 600851475143L
  val result = largestPrimeFactor(number)
  println(s"The largest prime factor of $number is $result")
}