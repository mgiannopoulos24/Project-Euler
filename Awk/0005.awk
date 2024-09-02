BEGIN {
    max_num = 20

    # Initialize array to keep track of maximum power of each prime factor
    split("", max_powers)

    # Function to check if a number is prime
    is_prime = 1
    for (num = 2; num <= max_num; num++) {
        # Check if num is prime
        is_prime = 1
        for (i = 2; i * i <= num; i++) {
            if (num % i == 0) {
                is_prime = 0
                break
            }
        }

        if (is_prime) {
            prime = num
            while (prime <= max_num) {
                # Determine the highest power of this prime factor within the range
                power = 0
                while (prime ^ power <= max_num) {
                    power++
                }
                power--
                
                if (power > 0) {
                    # Update the max_powers array with the highest power
                    max_powers[prime] = power
                }
                prime++
                
                # Find next prime
                while (1) {
                    is_prime = 1
                    for (i = 2; i * i <= prime; i++) {
                        if (prime % i == 0) {
                            is_prime = 0
                            break
                        }
                    }
                    if (is_prime) break
                    prime++
                }
            }
        }
    }

    # Calculate the result by multiplying prime factors raised to their max power
    result = 1
    for (prime in max_powers) {
        power = max_powers[prime]
        result *= prime ^ power
    }

    print result
}