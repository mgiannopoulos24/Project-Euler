with Ada.Text_IO; use Ada.Text_IO;
with Ada.Containers.Vectors;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure Pentagonal_Difference is

   -- Define a vector to store pentagonal numbers
   package Pentagonal_Vectors is new Ada.Containers.Vectors
     (Index_Type => Natural, Element_Type => Integer);
   use Pentagonal_Vectors;

   Pentagonals : Vector;

   -- Function to compute the nth pentagonal number
   function Pentagonal_Number(N : Integer) return Integer is
   begin
      return N * (3 * N - 1) / 2;
   end Pentagonal_Number;

   -- Function to check if a number is pentagonal
   function Is_Pentagonal(X : Integer) return Boolean is
      N : Integer := Integer(Float'Floor((1.0 + Sqrt(1.0 + 24.0 * Float(X))) / 6.0));
   begin
      return N * (3 * N - 1) / 2 = X;
   end Is_Pentagonal;

   -- Main procedure logic
   Min_D : Integer := Integer'Last;
begin
   -- Generate pentagonal numbers up to a reasonable limit
   for N in 1 .. 5000 loop
      Pentagonals.Append(Pentagonal_Number(N));
   end loop;

   -- Iterate over pairs of pentagonal numbers
   for I in First_Index(Pentagonals) .. Last_Index(Pentagonals) - 1 loop
      for J in I + 1 .. Last_Index(Pentagonals) loop
         declare
            P_I : constant Integer := Pentagonals(I);
            P_J : constant Integer := Pentagonals(J);
            Sum : constant Integer := P_I + P_J;
            Diff : constant Integer := abs (P_J - P_I);
         begin
            -- Check if both the sum and difference are pentagonal
            if Is_Pentagonal(Sum) and then Is_Pentagonal(Diff) then
               if Diff < Min_D then
                  Min_D := Diff;
               end if;
            end if;
         end;
      end loop;
   end loop;

   -- Output the result
   Put_Line("The minimum D is: " & Integer'Image(Min_D));
end Pentagonal_Difference;