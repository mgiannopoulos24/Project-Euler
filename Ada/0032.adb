with Ada.Text_IO; use Ada.Text_IO;
with Ada.Containers.Ordered_Sets;
with Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Pandigital_Products is
   function Is_Pandigital (S : String) return Boolean is
      Count : array (1 .. 9) of Natural := (others => 0);
   begin
      if S'Length /= 9 then
         return False;
      end if;
      for C of S loop
         if C not in '1' .. '9' then
            return False;
         end if;
         Count (Character'Pos (C) - Character'Pos ('0')) := 
           Count (Character'Pos (C) - Character'Pos ('0')) + 1;
      end loop;
      for I in Count'Range loop
         if Count (I) /= 1 then
            return False;
         end if;
      end loop;
      return True;
   end Is_Pandigital;

   package Product_Set is new Ada.Containers.Ordered_Sets (Integer);
   use Product_Set;
   Products : Set;
   Sum : Integer := 0;
   S : Unbounded_String;
begin
   -- Check 1-digit * 4-digit = 4-digit cases
   for A in 1 .. 9 loop
      for B in 1000 .. 9999 loop
         declare
            C : constant Integer := A * B;
            Str : String := 
              Ada.Strings.Fixed.Trim (Integer'Image (A), Ada.Strings.Left) &
              Ada.Strings.Fixed.Trim (Integer'Image (B), Ada.Strings.Left) &
              Ada.Strings.Fixed.Trim (Integer'Image (C), Ada.Strings.Left);
         begin
            if C >= 1000 and C <= 9999 then
               if Is_Pandigital (Str) then
                  Include (Products, C);
               end if;
            end if;
         end;
      end loop;
   end loop;

   -- Check 2-digit * 3-digit = 4-digit cases
   for A in 10 .. 99 loop
      for B in 100 .. 999 loop
         declare
            C : constant Integer := A * B;
            Str : String := 
              Ada.Strings.Fixed.Trim (Integer'Image (A), Ada.Strings.Left) &
              Ada.Strings.Fixed.Trim (Integer'Image (B), Ada.Strings.Left) &
              Ada.Strings.Fixed.Trim (Integer'Image (C), Ada.Strings.Left);
         begin
            if C >= 1000 and C <= 9999 then
               if Is_Pandigital (Str) then
                  Include (Products, C);
               end if;
            end if;
         end;
      end loop;
   end loop;

   -- Sum all unique products
   for Prod of Products loop
      Sum := Sum + Prod;
   end loop;

   Put_Line ("Sum of all unique pandigital products: " & Integer'Image (Sum));
end Pandigital_Products;