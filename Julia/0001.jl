function sum_of_multiples(limit)
    total_sum = 0
    for i in 1:(limit - 1)
        if i % 3 == 0 || i % 5 == 0
            total_sum += i
        end
    end
    return total_sum
end

# Call the function with 1000 as the limit
println(sum_of_multiples(1000))
