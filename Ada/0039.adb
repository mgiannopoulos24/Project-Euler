with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Find_Max_Pythagorean_Perimeter is
   Max_Perimeter : constant Integer := 1000;
   Max_Solutions : Integer := 0;
   Best_Perimeter : Integer := 0;
   
   -- Array to hold the count of solutions for each perimeter
   Solutions_Count : array (1 .. Max_Perimeter) of Integer := (others => 0);
   
   -- Check if three sides form a right triangle using Pythagorean theorem
   function Is_Right_Triangle(A, B, C : Integer) return Boolean is
   begin
      return A*A + B*B = C*C;
   end Is_Right_Triangle;
   
begin
   -- For each possible perimeter p
   for P in 12 .. Max_Perimeter loop
      -- For each possible shortest side a
      for A in 3 .. (P / 3) loop
         -- For each possible middle side b
         for B in A .. (P - A) / 2 loop
            -- Calculate the longest side c
            declare
               C : constant Integer := P - A - B;
            begin
               -- Check if c is valid (forms a right triangle)
               if B <= C and then Is_Right_Triangle(A, B, C) then
                  Solutions_Count(P) := Solutions_Count(P) + 1;
               end if;
            end;
         end loop;
      end loop;
      
      -- Update maximum if needed
      if Solutions_Count(P) > Max_Solutions then
         Max_Solutions := Solutions_Count(P);
         Best_Perimeter := P;
      end if;
   end loop;
   
   -- Output results
   Put_Line("For perimeter = " & Integer'Image(Best_Perimeter) & 
            ", there are" & Integer'Image(Max_Solutions) & " solutions.");
   
   -- Verify the given examples
   Put_Line("Verification for p = 120:");
   declare
      Count : Integer := 0;
   begin
      -- For each possible shortest side a
      for A in 3 .. 40 loop
         -- For each possible middle side b
         for B in A .. (120 - A) / 2 loop
            -- Calculate the longest side c
            declare
               C : constant Integer := 120 - A - B;
            begin
               -- Check if c is valid (forms a right triangle)
               if B <= C and then Is_Right_Triangle(A, B, C) then
                  Count := Count + 1;
                  Put("Solution" & Integer'Image(Count) & ": {");
                  Put(A, 0); Put(", ");
                  Put(B, 0); Put(", ");
                  Put(C, 0); Put_Line("}");
               end if;
            end;
         end loop;
      end loop;
   end;
end Find_Max_Pythagorean_Perimeter;