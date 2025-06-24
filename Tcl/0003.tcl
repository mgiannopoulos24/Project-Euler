proc largest_prime_factor {n} {
    set max_prime -1

    # Step 1: Remove all factors of 2
    while {[expr {$n % 2}] == 0} {
        set max_prime 2
        set n [expr {$n / 2}]
    }

    # Step 2: Try odd factors from 3 upwards
    for {set i 3} {[expr {$i * $i}] <= $n} {incr i 2} {
        while {[expr {$n % $i}] == 0} {
            set max_prime $i
            set n [expr {$n / $i}]
        }
    }

    # Step 3: If remaining n is greater than 2, it's a prime
    if {$n > 2} {
        set max_prime $n
    }

    return $max_prime
}

# Compute and print result
set number 600851475143
set result [largest_prime_factor $number]
puts "The largest prime factor of $number is $result"