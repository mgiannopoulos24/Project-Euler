defmodule FibonacciSum do
  def sum_even_fibonacci(limit) do
    sum_even_fibonacci(1, 2, 0, limit)
  end

  defp sum_even_fibonacci(a, b, sum, limit) when a <= limit do
    new_sum = if rem(a, 2) == 0, do: sum + a, else: sum
    sum_even_fibonacci(b, a + b, new_sum, limit)
  end

  defp sum_even_fibonacci(_a, _b, sum, _limit) do
    sum
  end
end

defmodule Main do
  def run do
    limit = 4000000
    result = FibonacciSum.sum_even_fibonacci(limit)
    IO.puts("The sum of the even-valued terms is: #{result}")
  end
end

Main.run()
