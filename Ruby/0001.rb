# Define a method to calculate the sum of multiples of 3 or 5 below a given limit
def sum_of_multiples(limit)
    total_sum = 0
    (1...limit).each do |i|
      if i % 3 == 0 || i % 5 == 0
        total_sum += i
      end
    end
    total_sum
  end
  
  # Define the limit
  limit = 1000
  
  # Calculate the result
  result = sum_of_multiples(limit)
  
  # Print the result
  puts "The sum of all multiples of 3 or 5 below #{limit} is: #{result}"
  