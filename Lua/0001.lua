function sumOfMultiples(limit)
    local sum = 0
    for i = 1, limit - 1 do
        if i % 3 == 0 or i % 5 == 0 then
            sum = sum + i
        end
    end
    return sum
end

local limit = 1000

local result = sumOfMultiples(limit)
print("The sum of all multiples of 3 or 5 below " .. limit .. " is: " .. result)