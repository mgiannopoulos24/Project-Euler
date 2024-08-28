with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Largest_Palindrome is
   function Is_Palindrome(N : Integer) return Boolean is
      Original : Integer := N;
      Reversed : Integer := 0;
      Temp     : Integer := N;
      Digit    : Integer;
   begin
      while Temp > 0 loop
         Digit := Temp mod 10;
         Reversed := Reversed * 10 + Digit;
         Temp := Temp / 10;
      end loop;
      return Original = Reversed;
   end Is_Palindrome;

   Max_Palindrome : Integer := 0;
   I, J : Integer;
begin
   for I in 100 .. 999 loop
      for J in I .. 999 loop
         declare
            Product : Integer := I * J;
         begin
            if Is_Palindrome(Product) and then Product > Max_Palindrome then
               Max_Palindrome := Product;
            end if;
         end;
      end loop;
   end loop;

   Put_Line ("The largest palindrome made from the product of two 3-digit numbers is: " & Integer'Image(Max_Palindrome));
end Largest_Palindrome;
