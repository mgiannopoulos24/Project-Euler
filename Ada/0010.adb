with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure Sum_Primes is
   Max : constant Integer := 2_000_000;
   Primes : array (2 .. Max) of Boolean := (others => True);
   Sum : Long_Long_Integer := 0;
begin
   -- Sieve of Eratosthenes
   for I in 2 .. Integer (Sqrt (Float (Max))) loop
      if Primes (I) then
         for J in I * I .. Max loop
            if J mod I = 0 then
               Primes (J) := False;
            end if;
         end loop;
      end if;
   end loop;

   -- Summing up the primes
   for I in 2 .. Max loop
      if Primes (I) then
         Sum := Sum + Long_Long_Integer (I);
      end if;
   end loop;

   Put_Line ("The sum of all primes below " & Integer'Image (Max) & " is " & Long_Long_Integer'Image (Sum));
end Sum_Primes;
