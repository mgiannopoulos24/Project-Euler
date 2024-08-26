def sum_even_fibonacci(limit)
    a, b = 1, 2
    even_sum = 0
  
    while a <= limit
      if a.even?
        even_sum += a
      end
      a, b = b, a + b
    end
  
    even_sum
  end
  
  # Define the limit (4 million)
  limit = 4000000
  
  # Calculate the sum of even-valued Fibonacci numbers
  result = sum_even_fibonacci(limit)
  
  # Print the result
  puts "The sum of the even-valued terms is: #{result}"
  