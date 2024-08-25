program SumMultiples;

var
  i: Integer;
  sum: LongInt;  { Use LongInt to handle larger sums }

begin
  sum := 0;

  for i := 1 to 999 do
  begin
    if (i mod 3 = 0) or (i mod 5 = 0) then
      sum := sum + i;
  end;

  writeln('The sum of all multiples of 3 or 5 below 1000 is: ', sum);

  readln;  { This is used to pause the output screen, similar to Sleep in VB. }
end.
