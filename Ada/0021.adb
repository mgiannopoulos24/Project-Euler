with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure Sum_Of_Amicable_Numbers is

   -- Function to compute the sum of proper divisors of n
   function Sum_Of_Proper_Divisors(N : Integer) return Integer is
      Sum : Integer := 1; -- 1 is always a proper divisor
   begin
      for I in 2 .. Integer(Sqrt(Float(N))) loop
         if N mod I = 0 then
            Sum := Sum + I;
            if I /= N / I then -- Add the quotient if it's different from I
               Sum := Sum + N / I;
            end if;
         end if;
      end loop;
      return Sum;
   end Sum_Of_Proper_Divisors;

   Limit : constant Integer := 10_000;
   D : array (1 .. Limit) of Integer; -- Array to store the sum of proper divisors
   Sum_Amicable : Integer := 0;

begin
   -- Compute the sum of proper divisors for each number up to the limit
   for I in 1 .. Limit loop
      D(I) := Sum_Of_Proper_Divisors(I);
   end loop;

   -- Find amicable pairs
   for A in 1 .. Limit loop
      declare
         B : Integer := D(A);
      begin
         if B <= Limit and then B > A and then D(B) = A then
            Sum_Amicable := Sum_Amicable + A + B;
         end if;
      end;
   end loop;

   -- Print the result
   Put_Line("The sum of all amicable numbers under 10000 is: " &
            Integer'Image(Sum_Amicable));
end Sum_Of_Amicable_Numbers;