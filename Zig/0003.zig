const std = @import("std");

fn largestPrimeFactor(n: u64) u64 {
    var number = n;
    var max_prime: u64 = 0;

    // Step 1: Remove all factors of 2
    while (number % 2 == 0) {
        max_prime = 2;
        number /= 2;
    }

    // Step 2: Try odd factors from 3 upwards
    var i: u64 = 3;
    while (i * i <= number) : (i += 2) {
        while (number % i == 0) {
            max_prime = i;
            number /= i;
        }
    }

    // Step 3: If what's left is greater than 2, it's a prime
    if (number > 2) {
        max_prime = number;
    }

    return max_prime;
}

pub fn main() void {
    const number: u64 = 600851475143;
    const result = largestPrimeFactor(number);
    std.debug.print("The largest prime factor of {d} is {d}\n", .{number, result});
}