with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Generic_Elementary_Functions;

procedure Longest_Consecutive_Prime_Sum is

   -- Define package for Long_Float math functions
   package Math_Functions is new Ada.Numerics.Generic_Elementary_Functions (Long_Float);
   use Math_Functions;

   LIMIT : constant := 1_000_000;

   type Boolean_Array is array (0 .. LIMIT) of Boolean;
   Is_Prime : Boolean_Array;

   -- Sieve of Eratosthenes
   procedure Sieve_Of_Eratosthenes is
      P : Integer;
   begin
      for I in Is_Prime'Range loop
         Is_Prime(I) := True;
      end loop;
      Is_Prime(0) := False;
      Is_Prime(1) := False;

      -- Use Sqrt with Long_Float
      for P in 2 .. Integer(Sqrt(Long_Float(LIMIT))) loop
         if Is_Prime(P) then
            for Multiple in P * P .. LIMIT loop
               if (Multiple mod P) = 0 then
                  Is_Prime(Multiple) := False;
               end if;
            end loop;
         end if;
      end loop;
   end Sieve_Of_Eratosthenes;

   -- Store all primes below LIMIT
   Max_Primes : constant := 78498; -- Approximate number of primes under 1,000,000
   Primes     : array (1 .. Max_Primes) of Integer;
   Prime_Count : Natural := 0;

   Max_Length : Natural := 0;
   Result     : Integer := 0;

begin
   Sieve_Of_Eratosthenes;

   -- Collect all primes into the Primes array
   for I in 2 .. LIMIT loop
      if Is_Prime(I) then
         if Prime_Count < Max_Primes then
            Prime_Count := Prime_Count + 1;
            Primes(Prime_Count) := I;
         else
            exit; -- Just in case we exceed preallocated size
         end if;
      end if;
   end loop;

   -- Try all starting points for consecutive sums
   for Start in 1 .. Prime_Count loop
      declare
         Sum    : Long_Integer := 0;
         Length : Natural := 0;
      begin
         for End_Index in Start .. Prime_Count loop
            Sum := Sum + Long_Integer(Primes(End_Index));  -- Explicit type conversion
            Length := Length + 1;

            exit when Sum >= Long_Integer(LIMIT);

            if Is_Prime(Integer(Sum)) then
               if Length > Max_Length then
                  Max_Length := Length;
                  Result := Integer(Sum);
               end if;
            end if;
         end loop;
      end;
   end loop;

   Put_Line("The prime below one million that can be written as the sum of the most consecutive primes is: " & Integer'Image(Result));

end Longest_Consecutive_Prime_Sum;