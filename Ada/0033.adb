with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure CuriousFractions is
   function GCD(A, B : Integer) return Integer is
      Temp : Integer;
      X : Integer := A;
      Y : Integer := B;
   begin
      while Y /= 0 loop
         Temp := X mod Y;
         X := Y;
         Y := Temp;
      end loop;
      return X;
   end GCD;
   
   Num_Product : Integer := 1;
   Den_Product : Integer := 1;
   
   Original_Numerator, Original_Denominator : Integer;
   New_Numerator, New_Denominator : Integer;
   N1, N2, D1, D2 : Integer;
   Common_Digit : Integer;
   Found : Boolean;
begin
   for Numerator in 10..98 loop
      for Denominator in Numerator+1..99 loop
         -- Extract digits
         N1 := Numerator / 10;
         N2 := Numerator mod 10;
         D1 := Denominator / 10;
         D2 := Denominator mod 10;
         
         -- Skip trivial cases (where both end with 0)
         if N2 = 0 and D2 = 0 then
            goto Next_Fraction;
         end if;
         
         -- Check all possible digit cancellations
         Found := False;
         
         -- Case 1: N1 = D1
         if N1 = D1 and D1 /= 0 then
            New_Numerator := N2;
            New_Denominator := D2;
            Found := True;
         -- Case 2: N1 = D2
         elsif N1 = D2 then
            New_Numerator := N2;
            New_Denominator := D1;
            Found := True;
         -- Case 3: N2 = D1
         elsif N2 = D1 then
            New_Numerator := N1;
            New_Denominator := D2;
            Found := True;
         -- Case 4: N2 = D2 and N2 /= 0
         elsif N2 = D2 and N2 /= 0 then
            New_Numerator := N1;
            New_Denominator := D1;
            Found := True;
         end if;
         
         if Found then
            -- Check if original fraction equals new fraction when simplified
            Original_Numerator := Numerator;
            Original_Denominator := Denominator;
            
            -- Simplify original fraction
            declare
               Gcd_Original : Integer := GCD(Original_Numerator, Original_Denominator);
               Simplified_Num : Integer := Original_Numerator / Gcd_Original;
               Simplified_Den : Integer := Original_Denominator / Gcd_Original;
            begin
               -- Simplify new fraction
               if New_Denominator /= 0 then
                  declare
                     Gcd_New : Integer := GCD(New_Numerator, New_Denominator);
                     New_Simplified_Num : Integer := New_Numerator / Gcd_New;
                     New_Simplified_Den : Integer := New_Denominator / Gcd_New;
                  begin
                     if Simplified_Num = New_Simplified_Num and 
                        Simplified_Den = New_Simplified_Den then
                        -- Found a curious fraction
                        Put_Line("Found: " & Integer'Image(Numerator) & "/" & Integer'Image(Denominator));
                        Num_Product := Num_Product * Numerator;
                        Den_Product := Den_Product * Denominator;
                     end if;
                  end;
               end if;
            end;
         end if;
         
         <<Next_Fraction>>
         null;
      end loop;
   end loop;
   
   -- Simplify the product
   declare
      Gcd_Product : Integer := GCD(Num_Product, Den_Product);
      Simplified_Denominator : Integer := Den_Product / Gcd_Product;
   begin
      Put_Line("The denominator of the product in lowest terms is:");
      Put(Simplified_Denominator);
      New_Line;
   end;
end CuriousFractions;