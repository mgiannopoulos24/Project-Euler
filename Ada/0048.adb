with Ada.Text_IO; use Ada.Text_IO;

procedure Self_Powers is
   MODULUS : constant Long_Long_Integer := 10_000_000_000; -- 10^10
   Sum     : Long_Long_Integer := 0;

   -- Safe modular multiplication to avoid overflow
   function Mul_Mod (A, B, Modulus : Long_Long_Integer) return Long_Long_Integer is
      Result : Long_Long_Integer := 0;
      Temp_B : Long_Long_Integer := B;
      Temp_A : Long_Long_Integer := A;
   begin
      if Temp_A < 0 then
         Temp_A := Temp_A + Modulus;
      end if;
      if Temp_B < 0 then
         Temp_B := Temp_B + Modulus;
      end if;

      while Temp_B > 0 loop
         if Temp_B mod 2 = 1 then
            Result := (Result + Temp_A) mod Modulus;
         end if;
         Temp_A := (Temp_A * 2) mod Modulus;
         Temp_B := Temp_B / 2;
      end loop;

      return Result;
   end Mul_Mod;

   -- Compute Base^Exponent mod MODULUS using safe modular exponentiation
   function Power_Mod (Base, Exponent : Integer) return Long_Long_Integer is
      Result : Long_Long_Integer := 1;
      B      : Long_Long_Integer := Long_Long_Integer (Base) mod MODULUS;
      E      : Integer := Exponent;
   begin
      while E > 0 loop
         if E mod 2 = 1 then
            Result := Mul_Mod (Result, B, MODULUS);
         end if;
         B := Mul_Mod (B, B, MODULUS);
         E := E / 2;
      end loop;
      return Result;
   end Power_Mod;

begin
   for I in 1 .. 1000 loop
      Sum := (Sum + Power_Mod (I, I)) mod MODULUS;
   end loop;

   Put_Line ("The last ten digits of the series are: " &
             Long_Long_Integer'Image (Sum));
end Self_Powers;