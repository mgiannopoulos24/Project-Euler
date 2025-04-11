with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Generic_Elementary_Functions;
with Ada.Numerics.Long_Elementary_Functions;

procedure Fibonacci_Index is
   package Math renames Ada.Numerics.Long_Elementary_Functions;
   
   -- Function to calculate the index of the first Fibonacci number with 1000 digits
   function Find_Fibonacci_Index_With_1000_Digits return Integer is
      Phi : constant Long_Float := (1.0 + Math.Sqrt(5.0)) / 2.0; -- Golden ratio
      Log_Phi : constant Long_Float := Math.Log(Phi, 10.0);      -- Logarithm base 10 of phi
      Log_Sqrt_5 : constant Long_Float := Math.Log(Math.Sqrt(5.0), 10.0); -- Logarithm base 10 of sqrt(5)
      
      -- Calculate the minimum n such that F_n has 1000 digits
      N : constant Integer := Integer(Long_Float'Ceiling((999.0 + Log_Sqrt_5) / Log_Phi));
   begin
      return N;
   end Find_Fibonacci_Index_With_1000_Digits;
   
   Index : Integer;
begin
   Index := Find_Fibonacci_Index_With_1000_Digits;
   Put_Line("The index of the first Fibonacci term to contain 1000 digits is: " & Integer'Image(Index));
end Fibonacci_Index;