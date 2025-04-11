with Ada.Text_IO; use Ada.Text_IO;

procedure Max_Path_Sum is

   -- Define the size of the triangle
   SIZE : constant := 15;

   -- Declare the triangle as a 2D array
   type Triangle_Array is array (0 .. SIZE - 1, 0 .. SIZE - 1) of Integer;

   -- Initialize the triangle with the given values
   Triangle : Triangle_Array :=
     ((75, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
      (95, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
      (17, 47, 82, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
      (18, 35, 87, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
      (20, 4, 82, 47, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
      (19, 1, 23, 75, 3, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0),
      (88, 2, 77, 73, 7, 63, 67, 0, 0, 0, 0, 0, 0, 0, 0),
      (99, 65, 4, 28, 6, 16, 70, 92, 0, 0, 0, 0, 0, 0, 0),
      (41, 41, 26, 56, 83, 40, 80, 70, 33, 0, 0, 0, 0, 0, 0),
      (41, 48, 72, 33, 47, 32, 37, 16, 94, 29, 0, 0, 0, 0, 0),
      (53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14, 0, 0, 0, 0),
      (70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57, 0, 0, 0),
      (91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48, 0, 0),
      (63, 66, 4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31, 0),
      (4, 62, 98, 27, 23, 9, 70, 98, 73, 93, 38, 53, 60, 4, 23));

   -- Function to find the maximum total from top to bottom
   function Find_Max_Path_Sum (T : in out Triangle_Array; N : Integer) return Integer is
   begin
      -- Start from the second-to-last row and work upwards
      for I in reverse 0 .. N - 2 loop
         for J in 0 .. I loop
            -- Update the value at T(I, J) to be the sum of itself and the maximum of the two adjacent numbers below it
            if T(I + 1, J) > T(I + 1, J + 1) then
               T(I, J) := T(I, J) + T(I + 1, J);
            else
               T(I, J) := T(I, J) + T(I + 1, J + 1);
            end if;
         end loop;
      end loop;

      -- The top element now contains the maximum total from top to bottom
      return T(0, 0);
   end Find_Max_Path_Sum;

   -- Variable to store the maximum sum
   Max_Sum : Integer;

begin
   -- Find the maximum total from top to bottom
   Max_Sum := Find_Max_Path_Sum(Triangle, SIZE);

   -- Print the result
   Put_Line("The maximum total from top to bottom is: " & Integer'Image(Max_Sum));
end Max_Path_Sum;