defmodule PrimeFactor do
  # Function to find the largest prime factor
  def largest_prime_factor(n) do
    # Define the function to handle the factorization
    largest_prime_factor(n, 2)
  end

  defp largest_prime_factor(1, largest), do: largest

  defp largest_prime_factor(n, largest) when rem(n, 2) == 0 do
    largest_prime_factor(div(n, 2), 2)
  end

  defp largest_prime_factor(n, largest) do
    largest_prime_factor_odd(n, largest, 3)
  end

  defp largest_prime_factor_odd(1, largest, _), do: largest

  defp largest_prime_factor_odd(n, largest, i) when i * i > n do
    if n > largest do
      n
    else
      largest
    end
  end

  defp largest_prime_factor_odd(n, largest, i) when rem(n, i) == 0 do
    largest_prime_factor_odd(div(n, i), i, i)
  end

  defp largest_prime_factor_odd(n, largest, i) do
    largest_prime_factor_odd(n, largest, i + 2)
  end
end

number = 600851475143
result = PrimeFactor.largest_prime_factor(number)
IO.puts("The largest prime factor of #{number} is #{result}")
