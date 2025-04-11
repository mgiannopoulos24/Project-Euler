with Ada.Text_IO; use Ada.Text_IO;

procedure Fifth_Power_Sum is

   -- Function to compute the fifth power of a digit
   function Fifth_Power (Digit : Integer) return Integer is
   begin
      return Digit * Digit * Digit * Digit * Digit;
   end Fifth_Power;

   -- Function to compute the sum of the fifth powers of the digits of a number
   function Sum_Of_Fifth_Powers (Number : Integer) return Integer is
      Sum : Integer := 0;
      Temp : Integer := Number;
   begin
      while Temp > 0 loop
         Sum := Sum + Fifth_Power(Temp mod 10);
         Temp := Temp / 10;
      end loop;
      return Sum;
   end Sum_Of_Fifth_Powers;

   -- Variable to store the final result
   Result : Integer := 0;

begin
   -- Iterate through all numbers from 2 to 354294
   for I in 2 .. 354294 loop
      if Sum_Of_Fifth_Powers(I) = I then
         Result := Result + I;
      end if;
   end loop;

   -- Output the result
   Put_Line("Sum of all numbers that can be written as the sum of fifth powers of their digits: " & Integer'Image(Result));
end Fifth_Power_Sum;