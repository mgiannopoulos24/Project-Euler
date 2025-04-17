with Ada.Text_IO; use Ada.Text_IO;

procedure Count_Ways_To_Make_Two_Pounds is
   -- Define the coin denominations in pence
   type Coin_Denomination is (One_P, Two_P, Five_P, Ten_P, Twenty_P, Fifty_P, One_Pound, Two_Pounds);
   Coin_Values : constant array(Coin_Denomination) of Integer :=
      (1, 2, 5, 10, 20, 50, 100, 200);

   -- Maximum amount to make (2 pounds = 200 pence)
   Max_Amount : constant Integer := 200;

   -- Array to store the number of ways to make each amount
   Ways : array(0 .. Max_Amount) of Integer := (others => 0);

begin
   -- There is 1 way to make 0 pence (using no coins)
   Ways(0) := 1;

   -- Iterate over each coin denomination
   for Coin in Coin_Denomination'Range loop
      for Amount in 0 .. Max_Amount loop
         if Amount >= Coin_Values(Coin) then
            -- Update the number of ways to make the current amount
            Ways(Amount) := Ways(Amount) + Ways(Amount - Coin_Values(Coin));
         end if;
      end loop;
   end loop;

   -- Output the result
   Put_Line("Number of ways to make £2: " & Integer'Image(Ways(Max_Amount)));
end Count_Ways_To_Make_Two_Pounds;