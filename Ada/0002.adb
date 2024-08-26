with Ada.Text_IO; use Ada.Text_IO;

procedure Fibonacci_Sum is
   -- Define the Fibonacci sequence terms
   A : Natural := 1;
   B : Natural := 2;
   Sum : Natural := 0;
   Next : Natural;
begin
   -- Iterate until the terms exceed four million
   while A <= 4000000 loop
      -- Check if the term is even
      if A mod 2 = 0 then
         Sum := Sum + A;
      end if;

      -- Generate the next Fibonacci number
      Next := A + B;
      A := B;
      B := Next;
   end loop;

   -- Print the sum of the even-valued terms
   Put_Line("The sum of the even-valued terms is: " & Natural'Image(Sum));
end Fibonacci_Sum;
