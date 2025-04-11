with Ada.Text_IO; use Ada.Text_IO;

procedure AbundantNumbersSum is

   -- Function to calculate the sum of proper divisors of a number
   function Sum_Of_Proper_Divisors (N : Positive) return Natural is
      Sum : Natural := 0;
   begin
      for I in 1 .. N / 2 loop
         if N mod I = 0 then
            Sum := Sum + I;
         end if;
      end loop;
      return Sum;
   end Sum_Of_Proper_Divisors;

   -- Function to check if a number is abundant
   function Is_Abundant (N : Positive) return Boolean is
   begin
      return Sum_Of_Proper_Divisors (N) > N;
   end Is_Abundant;

   -- Maximum limit given in the problem
   Limit : constant Positive := 28123;

   -- Array to mark numbers that can be expressed as the sum of two abundant numbers
   Can_Be_Expressed_As_Sum : array (1 .. Limit) of Boolean := (others => False);

   -- Array to store abundant numbers (preallocate space for efficiency)
   Max_Abundant_Numbers : constant Positive := 7000; -- Estimated upper bound
   Abundant_Numbers     : array (1 .. Max_Abundant_Numbers) of Positive;
   Abundant_Count       : Natural := 0;

   -- Variable to store the sum of numbers that cannot be expressed as the sum of two abundant numbers
   Result_Sum : Natural := 0;

begin
   -- Step 1: Generate all abundant numbers up to the limit
   for I in 1 .. Limit loop
      if Is_Abundant (I) then
         Abundant_Count := Abundant_Count + 1;
         Abundant_Numbers (Abundant_Count) := I;
      end if;
   end loop;

   -- Step 2: Mark numbers that can be expressed as the sum of two abundant numbers
   for I in 1 .. Abundant_Count loop
      for J in I .. Abundant_Count loop
         declare
            Sum : constant Positive := Abundant_Numbers (I) + Abundant_Numbers (J);
         begin
            if Sum <= Limit then
               Can_Be_Expressed_As_Sum (Sum) := True;
            else
               exit; -- Since the list is sorted, further sums will exceed the limit
            end if;
         end;
      end loop;
   end loop;

   -- Step 3: Calculate the sum of numbers that cannot be expressed as such a sum
   for I in 1 .. Limit loop
      if not Can_Be_Expressed_As_Sum (I) then
         Result_Sum := Result_Sum + I;
      end if;
   end loop;

   -- Output the result
   Put_Line ("The sum of all positive integers which cannot be written as the sum of two abundant numbers is: " & Natural'Image (Result_Sum));

end AbundantNumbersSum;