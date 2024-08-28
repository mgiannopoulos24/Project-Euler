with Ada.Text_IO; use Ada.Text_IO;

procedure LCM_1_to_20 is
   -- Use the standard Ada.Long_Long_Integer to handle large numbers
   type Long_Long_Int is range -2_147_483_648 .. 2_147_483_647;

   -- Function to compute the Greatest Common Divisor (GCD) using the Euclidean algorithm
   function GCD(X, Y : Long_Long_Int) return Long_Long_Int is
   begin
      if Y = 0 then
         return X;
      else
         return GCD(Y, X mod Y);
      end if;
   end GCD;

   -- Function to compute the Least Common Multiple (LCM)
   function LCM(X, Y : Long_Long_Int) return Long_Long_Int is
   begin
      return (X * (Y / GCD(X, Y)));  -- Rearranged to minimize overflow
   end LCM;

   Result : Long_Long_Int := 1;
begin
   -- Compute the LCM of all numbers from 1 to 20
   for I in 1 .. 20 loop
      Result := LCM(Result, Long_Long_Int(I));
   end loop;

   -- Output the result
   Put_Line("The smallest positive number evenly divisible by all numbers from 1 to 20 is: " & Long_Long_Int'Image(Result));
end LCM_1_to_20;
