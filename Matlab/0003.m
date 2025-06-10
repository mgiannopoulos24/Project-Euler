n = 600851475143;
largestFactor = -1;

% Remove all factors of 2
while mod(n, 2) == 0
    largestFactor = 2;
    n = n / 2;
end

% Check for odd factors from 3 upwards
i = 3;
maxFactor = sqrt(n);
while i <= maxFactor
    while mod(n, i) == 0
        largestFactor = i;
        n = n / i;
        maxFactor = sqrt(n);
    end
    i = i + 2;
end

% If n > 2, then it's a prime
if n > 2
    largestFactor = n;
end

printf("The largest prime factor is: %d\n", largestFactor);