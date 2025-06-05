with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

procedure Largest_Pandigital_Product is
   -- Function to check if a string is pandigital (contains digits 1-9 exactly once)
   function Is_Pandigital(S : String) return Boolean is
      Digit_Seen : array (1..9) of Boolean := (others => False);
   begin
      if S'Length /= 9 then
         return False;
      end if;
      
      for I in S'Range loop
         declare
            Digit : Integer;
         begin
            Digit := Character'Pos(S(I)) - Character'Pos('0');
            
            -- Check if digit is in range 1-9 and hasn't been seen before
            if Digit < 1 or else Digit > 9 or else Digit_Seen(Digit) then
               return False;
            end if;
            
            Digit_Seen(Digit) := True;
         end;
      end loop;
      
      -- Check if all digits 1-9 have been seen
      for I in Digit_Seen'Range loop
         if not Digit_Seen(I) then
            return False;
         end if;
      end loop;
      
      return True;
   end Is_Pandigital;
   
   -- Function to convert an integer to a string
   function To_String(N : Integer) return String is
      S : String(1..20);  -- Buffer large enough for any integer
      Last : Natural;
   begin
      Put(S, N);
      -- Find the last non-space character
      Last := S'Last;
      while Last >= S'First and then S(Last) = ' ' loop
         Last := Last - 1;
      end loop;
      
      -- Find the first non-space character
      declare
         First : Natural := S'First;
      begin
         while First <= Last and then S(First) = ' ' loop
            First := First + 1;
         end loop;
         
         return S(First..Last);
      end;
   end To_String;
   
   -- Function to calculate the concatenated product
   function Concatenated_Product(Base : Integer; N : Integer) return String is
      Result : String(1..50);  -- Buffer large enough for any reasonable concatenation
      Length : Natural := 0;
   begin
      for I in 1..N loop
         declare
            Product : Integer := Base * I;
            Product_Str : String := To_String(Product);
         begin
            -- Concatenate the product string to the result
            if Length + Product_Str'Length <= Result'Length then
               Result(Length + 1..Length + Product_Str'Length) := Product_Str;
               Length := Length + Product_Str'Length;
            else
               -- Buffer overflow prevention
               return Result(1..Length);
            end if;
            
            -- If we already have more than 9 digits, no point continuing
            if Length > 9 then
               return Result(1..Length);
            end if;
         end;
      end loop;
      
      return Result(1..Length);
   end Concatenated_Product;
   
   Largest_Pandigital : String(1..9) := "000000000";
   
begin
   Put_Line("Searching for the largest pandigital concatenated product...");
   
   -- Try different bases and n values
   -- n must be at least 2 per the problem statement
   for N in 2..9 loop
      -- Maximum value for base depends on n
      declare
         Max_Base : Integer := 10000;  -- Conservative initial value
      begin
         if N = 2 then
            Max_Base := 9999;  -- Since 9999*1 + 9999*2 = 9999 + 19998 would have 10 digits
         elsif N = 3 then
            Max_Base := 999;
         elsif N = 4 then
            Max_Base := 99;
         elsif N = 5 then
            Max_Base := 99;
         elsif N > 5 then
            Max_Base := 9;  -- Conservative for n > 5
         end if;
         
         for Base in 1..Max_Base loop
            declare
               Concat : String := Concatenated_Product(Base, N);
            begin
               if Concat'Length = 9 and then Is_Pandigital(Concat) then
                  Put("Found pandigital: ");
                  Put(Concat);
                  Put(" (base = ");
                  Put(Base, Width => 0);
                  Put(", n = ");
                  Put(N, Width => 0);
                  Put_Line(")");
                  
                  -- Update if this is larger than our current largest
                  if Concat > Largest_Pandigital then
                     Largest_Pandigital := Concat;
                  end if;
               end if;
            end;
         end loop;
      end;
   end loop;
   
   Put_Line("The largest pandigital concatenated product is: " & Largest_Pandigital);
end Largest_Pandigital_Product;