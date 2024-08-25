# Define a procedure to calculate the sum of multiples of 3 or 5 below a given limit
proc sum_of_multiples {limit} {
    set total_sum 0
    for {set i 1} {$i < $limit} {incr i} {
        if {[expr {$i % 3 == 0 || $i % 5 == 0}]} {
            incr total_sum $i
        }
    }
    return $total_sum
}

# Define the limit
set limit 1000

# Calculate the result
set result [sum_of_multiples $limit]

# Print the result
puts "The sum of all multiples of 3 or 5 below $limit is: $result"
