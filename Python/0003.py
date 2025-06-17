def largest_prime_factor(n):
    # Step 1: Remove all factors of 2
    while n % 2 == 0:
        max_prime = 2
        n //= 2

    # Step 2: Try odd factors from 3 upwards
    i = 3
    while i * i <= n:
        while n % i == 0:
            max_prime = i
            n //= i
        i += 2

    # Step 3: If n is now greater than 2, then it's a prime
    if n > 2:
        max_prime = n

    return max_prime

number = 600851475143
result = largest_prime_factor(number)
print(f"The largest prime factor of {number} is {result}")