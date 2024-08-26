% Define the maximum value
max_val = 4000000;

% Initialize the first two terms of the Fibonacci sequence
term1 = 1;
term2 = 2;
sum_even = 0;

% Compute the sum of even Fibonacci numbers
while term1 <= max_val
    % Check if the current term is even
    if mod(term1, 2) == 0
        sum_even += term1;
    end
    
    % Calculate the next term in the Fibonacci sequence
    next_term = term1 + term2;
    term1 = term2;
    term2 = next_term;
end

% Output the result
printf('Sum of the even-valued terms: %d\n', sum_even);
