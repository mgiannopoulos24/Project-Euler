with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Long_Elementary_Functions; use Ada.Numerics.Long_Elementary_Functions;

procedure Triangle_Pentagonal_Hexagonal is
   -- Function to check if a number is pentagonal
   function Is_Pentagonal (X : Long_Long_Integer) return Boolean is
      -- Formula to check if x is pentagonal: (sqrt(24*x + 1) + 1) / 6 should be an integer
      X_Long_Float : Long_Float := Long_Float(X);
      Result : Long_Float;
      Result_Int : Long_Long_Integer;
   begin
      Result := (Sqrt(24.0 * X_Long_Float + 1.0) + 1.0) / 6.0;
      Result_Int := Long_Long_Integer(Result);
      return Long_Float(Result_Int) = Result;
   end Is_Pentagonal;

   -- Function to check if a number is hexagonal
   function Is_Hexagonal (X : Long_Long_Integer) return Boolean is
      -- Formula to check if x is hexagonal: (sqrt(8*x + 1) + 1) / 4 should be an integer
      X_Long_Float : Long_Float := Long_Float(X);
      Result : Long_Float;
      Result_Int : Long_Long_Integer;
   begin
      Result := (Sqrt(8.0 * X_Long_Float + 1.0) + 1.0) / 4.0;
      Result_Int := Long_Long_Integer(Result);
      return Long_Float(Result_Int) = Result;
   end Is_Hexagonal;

   -- Procedure to find the next triangle number that is also pentagonal and hexagonal
   procedure Find_Next_Number is
      M   : Long_Long_Integer := 286; -- Start from the next triangle number after T_285
      T_M : Long_Long_Integer;
   begin
      loop
         -- Calculate the current triangle number
         T_M := M * (M + 1) / 2;

         -- Check if T_M is pentagonal
         if Is_Pentagonal(T_M) then
            -- Check if T_M is hexagonal
            if Is_Hexagonal(T_M) then
               Put_Line("The next triangle number that is also pentagonal and hexagonal is: " & 
                        Long_Long_Integer'Image(T_M));
               exit;
            end if;
         end if;

         -- Move to the next triangle number
         M := M + 1;
      end loop;
   end Find_Next_Number;

begin
   Find_Next_Number;
end Triangle_Pentagonal_Hexagonal;