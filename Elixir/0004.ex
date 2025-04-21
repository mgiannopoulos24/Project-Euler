defmodule Palindrome do
  # Function to check if a number is a palindrome
  defp is_palindrome(num) do
    str = Integer.to_string(num)
    str == String.reverse(str)
  end

  # Function to find the largest palindrome
  def largest_palindrome do
    max_palindrome = 0

    # Iterate over all pairs of 3-digit numbers
    for i <- 999..100, j <- i..100 do
      product = i * j

      # If the product is smaller than the largest palindrome found, skip
      if product > max_palindrome and is_palindrome(product) do
        max_palindrome = product
      else
        max_palindrome
      end
    end
    |> Enum.max()
  end
end

# Run the function and print the result
IO.puts("The largest palindrome made from the product of two 3-digit numbers is: #{Palindrome.largest_palindrome()}")