function largest_prime_factor(n)
    local largestFactor = -1

    -- Remove all factors of 2
    while n % 2 == 0 do
        largestFactor = 2
        n = n / 2
    end

    -- Check for odd factors from 3 upwards
    local i = 3
    local maxFactor = math.sqrt(n)
    while i <= maxFactor do
        while n % i == 0 do
            largestFactor = i
            n = n / i
            maxFactor = math.sqrt(n)  -- Update upper limit
        end
        i = i + 2
    end

    -- If n is still greater than 2, then it's a prime
    if n > 2 then
        largestFactor = n
    end

    return largestFactor
end

-- Solve for the given number
local number = 600851475143
print("The largest prime factor of " .. number .. " is " .. largest_prime_factor(number))