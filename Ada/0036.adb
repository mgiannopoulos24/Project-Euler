with Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure Palindromic_Numbers is
   -- Function to check if a number is palindromic in base 10
   function Is_Palindrome_Base10(N : Integer) return Boolean is
      Original : Integer := N;
      Reversed : Integer := 0;
   begin
      declare
         Temp : Integer := Original;
      begin
         while Temp > 0 loop
            Reversed := Reversed * 10 + (Temp mod 10);
            Temp := Temp / 10;
         end loop;
      end;
      
      return Original = Reversed;
   end Is_Palindrome_Base10;
   
   -- Function to check if a number is palindromic in base 2
   function Is_Palindrome_Base2(N : Integer) return Boolean is
      -- First, convert N to binary representation
      Binary_Length : Integer := 0;
      Temp : Integer := N;
   begin
      -- Find length of binary representation
      while Temp > 0 loop
         Binary_Length := Binary_Length + 1;
         Temp := Temp / 2;
      end loop;
      
      -- Create array to hold binary digits
      declare
         Binary : array (1 .. Binary_Length) of Integer;
         Idx : Integer := Binary_Length;
         Original_N : Integer := N;
      begin
         -- Fill array with binary digits (right to left)
         while Original_N > 0 loop
            Binary(Idx) := Original_N mod 2;
            Original_N := Original_N / 2;
            Idx := Idx - 1;
         end loop;
         
         -- Check if binary representation is palindromic
         for I in 1 .. Binary_Length / 2 loop
            if Binary(I) /= Binary(Binary_Length - I + 1) then
               return False;
            end if;
         end loop;
         
         return True;
      end;
   end Is_Palindrome_Base2;
   
   Sum : Long_Integer := 0;
   
begin
   -- Check all numbers less than one million
   for I in 1 .. 999_999 loop
      if Is_Palindrome_Base10(I) and then Is_Palindrome_Base2(I) then
         Ada.Text_IO.Put("Found: ");
         Ada.Integer_Text_IO.Put(I, Width => 0);
         Ada.Text_IO.New_Line;
         Sum := Sum + Long_Integer(I);
      end if;
   end loop;
   
   Ada.Text_IO.Put("Sum of all palindromic numbers in both bases: ");
   Ada.Integer_Text_IO.Put(Integer(Sum), Width => 0);
   Ada.Text_IO.New_Line;
end Palindromic_Numbers;