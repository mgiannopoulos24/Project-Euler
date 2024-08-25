with Ada.Text_IO; use Ada.Text_IO;

procedure Sum_Multiples is
   Sum : Integer := 0;
begin
   -- Iterate over all numbers from 1 to 999
   for I in 1 .. 999 loop
      -- Check if the number is a multiple of 3 or 5
      if I mod 3 = 0 or else I mod 5 = 0 then
         Sum := Sum + I;
      end if;
   end loop;

   -- Output the result
   Put_Line("The sum of all multiples of 3 or 5 below 1000 is: " & Integer'Image(Sum));
end Sum_Multiples;
