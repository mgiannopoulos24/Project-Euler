-- Define the maximum value
local maxVal = 4000000

-- Initialize the first two terms of the Fibonacci sequence
local term1 = 1
local term2 = 2
local sumEven = 0

-- Compute the sum of even Fibonacci numbers
while term1 <= maxVal do
    -- Check if the current term is even
    if term1 % 2 == 0 then
        sumEven = sumEven + term1
    end

    -- Calculate the next term in the Fibonacci sequence
    local nextTerm = term1 + term2
    term1 = term2
    term2 = nextTerm
end

-- Output the result
print("Sum of the even-valued terms:", sumEven)
