with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Difference_Calculator is
   N : Integer := 100;
   Sum_Of_Squares : Long_Long_Integer := 0;
   Sum : Long_Long_Integer := 0;
   Square_Of_Sum : Long_Long_Integer;
   Difference : Long_Long_Integer;
begin
   -- Calculate the sum of squares and the sum of the first N natural numbers
   for I in 1 .. N loop
      Sum_Of_Squares := Sum_Of_Squares + Long_Long_Integer(I * I);
      Sum := Sum + Long_Long_Integer(I);
   end loop;

   -- Calculate the square of the sum
   Square_Of_Sum := Sum * Sum;

   -- Calculate the difference
   Difference := Square_Of_Sum - Sum_Of_Squares;

   -- Print the result
   Put_Line("The difference between the square of the sum and the sum of the squares of the first " &
            Integer'Image(N) & " natural numbers is " & Long_Long_Integer'Image(Difference));
end Difference_Calculator;
