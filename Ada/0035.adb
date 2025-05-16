with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Circular_Primes is
   Limit : constant := 1_000_000;

   -- Function to check if a number is prime
   function Is_Prime(N : Integer) return Boolean is
      I : Integer;
   begin
      if N <= 1 then
         return False;
      elsif N = 2 then
         return True;
      elsif N mod 2 = 0 then
         return False;
      end if;

      I := 3;
      while I * I <= N loop
         if N mod I = 0 then
            return False;
         end if;
         I := I + 2;
      end loop;

      return True;
   end Is_Prime;

   -- Function to count the number of digits in a number
   function Count_Digits(N : Integer) return Integer is
      Temp : Integer := N;
      Count : Integer := 0;
   begin
      while Temp > 0 loop
         Count := Count + 1;
         Temp := Temp / 10;
      end loop;
      return Count;
   end Count_Digits;

   -- Function to rotate the digits of a number
   function Rotate_Number(N : Integer) return Integer is
      Num_Digits : constant Integer := Count_Digits(N);
      Last_Digit : constant Integer := N mod 10;
      Remaining_Digits : constant Integer := N / 10;
      Power : Integer := 1;
   begin
      -- Compute 10^(Num_Digits - 1)
      for I in 1 .. Num_Digits - 1 loop
         Power := Power * 10;
      end loop;

      -- Return the rotated number
      return Last_Digit * Power + Remaining_Digits;
   end Rotate_Number;

   -- Function to check if a number is a circular prime
   function Is_Circular_Prime(N : Integer) return Boolean is
      Current : Integer := N;
      Original : Integer := N;
      Num_Digits : constant Integer := Count_Digits(N);
   begin
      for I in 1 .. Num_Digits loop
         if not Is_Prime(Current) then
            return False;
         end if;
         Current := Rotate_Number(Current);
         exit when Current = Original;
      end loop;

      return True;
   end Is_Circular_Prime;

   -- Main procedure to count circular primes below one million
   Count : Integer := 0;
begin
   for I in 2 .. Limit - 1 loop
      if Is_Circular_Prime(I) then
         Count := Count + 1;
      end if;
   end loop;

   Put("Number of circular primes below one million: ");
   Put(Count, Width => 0);
   New_Line;
end Circular_Primes;