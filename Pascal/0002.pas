program FibonacciSum;

var
  a, b, next, sum: QWord;

begin
  // Initialize the first two terms of the Fibonacci sequence
  a := 1;
  b := 2;
  sum := 0;

  // Iterate until the terms exceed four million
  while a <= 4000000 do
  begin
    // Check if the term is even
    if a mod 2 = 0 then
      sum := sum + a;
    
    // Generate the next Fibonacci number
    next := a + b;
    a := b;
    b := next;
  end;

  // Print the sum of the even-valued terms
  writeln('The sum of the even-valued terms is: ', sum);
end.
