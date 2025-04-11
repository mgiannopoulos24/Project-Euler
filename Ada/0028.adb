with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Spiral_Diagonal_Sum is

   -- Function to calculate the sum of diagonal elements in an n x n spiral
   function Sum_Of_Diagonals(N : in Integer) return Long_Long_Integer is
      Total_Sum : Long_Long_Integer := 1; -- Start with the center element (1)
      Layers    : Integer;
      Side_Length : Integer;
      Corner_Base : Integer;
      Layer_Sum   : Long_Long_Integer;
   begin
      if N mod 2 = 0 then
         Put_Line("Error: n must be odd.");
         return 0;
      end if;

      -- Number of layers in the spiral
      Layers := (N + 1) / 2;

      -- Iterate over each layer starting from the second layer
      for K in 2..Layers loop
         Side_Length := 2 * K - 1; -- Side length of the current layer
         Corner_Base := Side_Length * Side_Length; -- Largest number in the layer

         -- Sum of the four corners of the current layer
         Layer_Sum := 4 * Long_Long_Integer(Corner_Base) - 6 * Long_Long_Integer(Side_Length - 1);

         -- Add the layer sum to the total sum
         Total_Sum := Total_Sum + Layer_Sum;
      end loop;

      return Total_Sum;
   end Sum_Of_Diagonals;

   N      : constant Integer := 1001; -- Size of the spiral
   Result : Long_Long_Integer;
begin
   -- Calculate the sum of diagonal elements
   Result := Sum_Of_Diagonals(N);

   -- Output the result
   Put_Line("The sum of the numbers on the diagonals in a " & 
            Integer'Image(N) & " by " & Integer'Image(N) & 
            " spiral is: " & Long_Long_Integer'Image(Result));
end Spiral_Diagonal_Sum;