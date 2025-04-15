with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Containers.Ordered_Sets;
with Ada.Numerics.Big_Numbers.Big_Integers;

procedure Distinct_Powers is
   use Ada.Numerics.Big_Numbers.Big_Integers;

   package Big_Integer_Sets is new Ada.Containers.Ordered_Sets
     (Element_Type => Big_Integer);
   
   Distinct_Values : Big_Integer_Sets.Set;
   Result : Big_Integer;
   
   -- Function to calculate a^b efficiently
   function Power(Base : Integer; Exponent : Integer) return Big_Integer is
      Base_Big : constant Big_Integer := To_Big_Integer(Base);
      Result : Big_Integer := To_Big_Integer(1);
      B : Big_Integer := Base_Big;
      E : Integer := Exponent;
   begin
      while E > 0 loop
         if E mod 2 = 1 then
            Result := Result * B;
         end if;
         B := B * B;
         E := E / 2;
      end loop;
      return Result;
   end Power;
   
begin
   -- Calculate all a^b combinations
   for A in 2 .. 100 loop
      for B in 2 .. 100 loop
         Result := Power(A, B);
         Distinct_Values.Include(Result);
      end loop;
   end loop;
   
   -- Output the count of distinct values
   Put("Number of distinct terms: ");
   Put(Integer'Image(Integer(Distinct_Values.Length)));
   New_Line;
end Distinct_Powers;