defmodule MultiplesSum do
  def sum_of_multiples(limit) do
    Enum.reduce(0..(limit-1), 0, fn i, acc ->
      if rem(i, 3) == 0 or rem(i, 5) == 0 do
        acc + i
      else
        acc
      end
    end)
  end
end

# Usage
IO.puts("The sum of all multiples of 3 or 5 below 1000 is: #{MultiplesSum.sum_of_multiples(1000)}")
