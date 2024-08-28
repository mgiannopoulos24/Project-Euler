% Define the limit
limit = 1000;

% Initialize sum
sum = 0;

% Calculate the sum of multiples of 3 or 5
for i = 1:(limit-1)
  if mod(i, 3) == 0 || mod(i, 5) == 0
    sum += i;
  end
end

% Print the result
printf("The sum of all multiples of 3 or 5 below %d is: %d\n", limit, sum);
