def largest_prime_factor(n)
  max_prime = -1

  # Step 1: Remove all factors of 2
  while n % 2 == 0
    max_prime = 2
    n /= 2
  end

  # Step 2: Try odd factors from 3 upwards
  i = 3
  while i * i <= n
    while n % i == 0
      max_prime = i
      n /= i
    end
    i += 2
  end

  # Step 3: If n is now greater than 2, then it's a prime
  if n > 2
    max_prime = n
  end

  max_prime
end

number = 600851475143
result = largest_prime_factor(number)
puts "The largest prime factor of #{number} is #{result}"