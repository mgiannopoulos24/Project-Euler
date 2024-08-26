proc sum_even_fibonacci {limit} {
    # Initialize the first two Fibonacci numbers
    set a 1
    set b 2
    set even_sum 0

    # Loop to generate Fibonacci numbers and sum the even ones
    while {$a <= $limit} {
        if {$a % 2 == 0} {
            incr even_sum $a
        }
        set next [expr {$a + $b}]
        set a $b
        set b $next
    }

    return $even_sum
}

# Define the limit (4 million)
set limit 4000000

# Calculate the sum of even-valued Fibonacci numbers
set result [sum_even_fibonacci $limit]

# Print the result
puts "The sum of the even-valued terms is: $result"
