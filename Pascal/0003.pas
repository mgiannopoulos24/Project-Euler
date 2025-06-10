program LargestPrimeFactor;

uses
  Math;

function LargestPrimeFactor(n: Int64): Int64;
var
  maxPrime: Int64;
  i: Int64;
begin
  maxPrime := -1;

  // Step 1: Remove all factors of 2
  while (n mod 2 = 0) do
  begin
    maxPrime := 2;
    n := n div 2;
  end;

  // Step 2: Try odd factors from 3 upwards
  i := 3;
  while (i <= Floor(Sqrt(n))) do
  begin
    while (n mod i = 0) do
    begin
      maxPrime := i;
      n := n div i;
    end;
    i := i + 2;
  end;

  // Step 3: If n is now greater than 2, then it's a prime
  if n > 2 then
    maxPrime := n;

  LargestPrimeFactor := maxPrime;
end;

var
  number, result: Int64;
begin
  number := 600851475143;
  result := LargestPrimeFactor(number);
  Writeln('The largest prime factor of ', number, ' is ', result);
end.