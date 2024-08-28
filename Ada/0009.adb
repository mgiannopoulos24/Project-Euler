with Ada.Text_IO; use Ada.Text_IO;

procedure Find_Pythagorean_Triplet is
   Target_Sum : constant Integer := 1000;

   A, B, C : Integer;

begin
   -- Iterate over possible values of A and B
   for A in 1 .. Target_Sum / 3 loop
      for B in A + 1 .. Target_Sum / 2 loop
         C := Target_Sum - A - B;
         
         -- Check if it forms a Pythagorean triplet
         if A * A + B * B = C * C then
            Put_Line("The Pythagorean triplet is: a = " & Integer'Image(A) &
                     ", b = " & Integer'Image(B) & ", c = " & Integer'Image(C));
            Put_Line("The product abc is: " & Integer'Image(A * B * C));
            return;  -- Exit the procedure once the triplet is found
         end if;
      end loop;
   end loop;

   -- If no triplet is found
   Put_Line("No Pythagorean triplet found.");
end Find_Pythagorean_Triplet;
