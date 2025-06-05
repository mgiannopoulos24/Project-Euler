with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure Consecutive_Four_Prime_Factors is

   -- Function to count distinct prime factors of a number
   function Count_Distinct_Prime_Factors (Num : Integer) return Integer is
      N       : Integer := Num;
      Count   : Integer := 0;
      I       : Integer := 3;
      Sqrt_N  : Integer := 0;
   begin
      -- Check divisibility by 2
      if N mod 2 = 0 then
         Count := Count + 1;
         while N mod 2 = 0 loop
            N := N / 2;
         end loop;
      end if;

      -- Check for odd divisors up to sqrt(N)
      Sqrt_N := Integer(Sqrt(Float(N)));
      while I <= Sqrt_N loop
         if N mod I = 0 then
            Count := Count + 1;
            while N mod I = 0 loop
               N := N / I;
            end loop;
            Sqrt_N := Integer(Sqrt(Float(N))); -- Update sqrt after division
         end if;
         I := I + 2;
      end loop;

      -- If remaining number is a prime > 2
      if N > 1 then
         Count := Count + 1;
      end if;

      return Count;
   end Count_Distinct_Prime_Factors;

   -- Main search loop
   N : Integer := 2;

begin
   loop
      if
        Count_Distinct_Prime_Factors(N) = 4 and then
        Count_Distinct_Prime_Factors(N + 1) = 4 and then
        Count_Distinct_Prime_Factors(N + 2) = 4 and then
        Count_Distinct_Prime_Factors(N + 3) = 4
      then
         Put_Line ("The first of these numbers is: " & Integer'Image(N));
         exit;
      end if;
      N := N + 1;
   end loop;
end Consecutive_Four_Prime_Factors;