with Ada.Text_IO; use Ada.Text_IO;

procedure Binomial_Coefficient is

   -- Function to compute factorial
   function Factorial(N : Long_Long_Integer) return Long_Long_Integer is
      Result : Long_Long_Integer := 1;
   begin
      for I in 1 .. N loop
         Result := Result * I;
      end loop;
      return Result;
   end Factorial;

   -- Function to compute binomial coefficient C(n, k)
   function Binomial_Coefficient(N, K : Long_Long_Integer) return Long_Long_Integer is
      Temp : Long_Long_Integer;
      Result : Long_Long_Integer := 1;
      K_Local : Long_Long_Integer := K;  -- Use a local variable to modify K
   begin
      if K_Local > N - K_Local then
         K_Local := N - K_Local; -- Take advantage of symmetry
      end if;

      for I in 0 .. K_Local - 1 loop
         Result := Result * (N - I);
         Result := Result / (I + 1);
      end loop;

      return Result;
   end Binomial_Coefficient;

   N : Long_Long_Integer := 40;
   K : Long_Long_Integer := 20;
   Result : Long_Long_Integer;

begin
   -- Calculate binomial coefficient C(40, 20)
   Result := Binomial_Coefficient(N, K);

   -- Print the result
   Put_Line("The number of routes through a 20x20 grid is: " & Long_Long_Integer'Image(Result));

end Binomial_Coefficient;
