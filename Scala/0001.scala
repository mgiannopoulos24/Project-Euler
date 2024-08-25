object SumMultiples {
  def sumOfMultiples(limit: Int): Int = {
    (1 until limit).filter(n => n % 3 == 0 || n % 5 == 0).sum
  }

  def main(args: Array[String]): Unit = {
    val limit = 1000
    val result = sumOfMultiples(limit)
    println(s"The sum of all multiples of 3 or 5 below $limit is: $result")
  }
}
