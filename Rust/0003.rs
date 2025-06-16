fn largest_prime_factor(n: u64) -> u64 {
    let mut n = n;
    let mut max_prime: u64 = 0;

    // Step 1: Remove all factors of 2
    while n % 2 == 0 {
        max_prime = 2;
        n /= 2;
    }

    // Step 2: Try odd factors from 3 upwards
    let mut i = 3;
    while i * i <= n {
        while n % i == 0 {
            max_prime = i;
            n /= i;
        }
        i += 2;
    }

    // Step 3: If n is now greater than 2, then it's a prime
    if n > 2 {
        max_prime = n;
    }

    max_prime
}

fn main() {
    let number: u64 = 600851475143;
    let result = largest_prime_factor(number);
    println!("The largest prime factor of {} is {}", number, result);
}