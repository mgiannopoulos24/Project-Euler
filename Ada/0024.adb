with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Nth_Permutation is
   -- First define array type for digits
   type Integer_Array is array (Positive range <>) of Integer;

   -- Function to compute factorial
   function Factorial(N : in Integer) return Long_Long_Integer is
      Result : Long_Long_Integer := 1;
   begin
      for I in 2..N loop
         Result := Result * Long_Long_Integer(I);
      end loop;
      return Result;
   end Factorial;

   -- Function to find the nth lexicographic permutation
   procedure Find_Nth_Permutation(
      N : in Long_Long_Integer;
      Digit_Array : in Integer_Array;
      Size : in Integer) is
      Local_N : Long_Long_Integer := N - 1; -- 0-indexed
      Result : Integer_Array(1..Size);
      Remaining : Integer_Array := Digit_Array;
   begin
      for I in 1..Size loop
         declare
            Fact : constant Long_Long_Integer := Factorial(Size - I);
            Index : Integer := Integer(Local_N / Fact);
         begin
            Result(I) := Remaining(Index + 1); -- Ada arrays are 1-based

            -- Remove the selected digit from remaining digits
            for J in Index+1..Remaining'Last-1 loop
               Remaining(J) := Remaining(J+1);
            end loop;

            Local_N := Local_N mod Fact;
         end;
      end loop;

      -- Print the resulting permutation
      for I in 1..Size loop
         Put(Result(I), Width => 0);
      end loop;
      New_Line;
   end Find_Nth_Permutation;

   -- Digits to permute
   Initial_Digits : constant Integer_Array := (0, 1, 2, 3, 4, 5, 6, 7, 8, 9);

   -- Target permutation (1,000,000th)
   N : constant Long_Long_Integer := 1_000_000;

begin
   -- Find and print the nth permutation
   Find_Nth_Permutation(N, Initial_Digits, Initial_Digits'Length);
end Nth_Permutation;