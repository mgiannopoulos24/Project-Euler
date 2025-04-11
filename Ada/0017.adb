with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Number_To_Words is

   -- Arrays for word representations
   Units : constant array (0 .. 9) of Unbounded_String :=
     (To_Unbounded_String(""),
      To_Unbounded_String("one"),
      To_Unbounded_String("two"),
      To_Unbounded_String("three"),
      To_Unbounded_String("four"),
      To_Unbounded_String("five"),
      To_Unbounded_String("six"),
      To_Unbounded_String("seven"),
      To_Unbounded_String("eight"),
      To_Unbounded_String("nine"));

   Teens : constant array (1 .. 9) of Unbounded_String :=
     (To_Unbounded_String("eleven"),
      To_Unbounded_String("twelve"),
      To_Unbounded_String("thirteen"),
      To_Unbounded_String("fourteen"),
      To_Unbounded_String("fifteen"),
      To_Unbounded_String("sixteen"),
      To_Unbounded_String("seventeen"),
      To_Unbounded_String("eighteen"),
      To_Unbounded_String("nineteen"));

   Tens : constant array (0 .. 9) of Unbounded_String :=
     (To_Unbounded_String(""),
      To_Unbounded_String("ten"),
      To_Unbounded_String("twenty"),
      To_Unbounded_String("thirty"),
      To_Unbounded_String("forty"),
      To_Unbounded_String("fifty"),
      To_Unbounded_String("sixty"),
      To_Unbounded_String("seventy"),
      To_Unbounded_String("eighty"),
      To_Unbounded_String("ninety"));

   Hundreds : constant array (0 .. 9) of Unbounded_String :=
     (To_Unbounded_String(""),
      To_Unbounded_String("one hundred"),
      To_Unbounded_String("two hundred"),
      To_Unbounded_String("three hundred"),
      To_Unbounded_String("four hundred"),
      To_Unbounded_String("five hundred"),
      To_Unbounded_String("six hundred"),
      To_Unbounded_String("seven hundred"),
      To_Unbounded_String("eight hundred"),
      To_Unbounded_String("nine hundred"));

   Thousands : constant Unbounded_String := To_Unbounded_String("one thousand");

   -- Function to count letters in a string, excluding spaces and hyphens
   function Count_Letters (Str : String) return Natural is
      Count : Natural := 0;
   begin
      for I in Str'Range loop
         if Str(I) /= ' ' and Str(I) /= '-' then
            Count := Count + 1;
         end if;
      end loop;
      return Count;
   end Count_Letters;

   -- Procedure to convert a number into words
   procedure Number_To_Words (Num : Integer; Words : out Unbounded_String) is
      Num_Copy : Integer := Num;
      Hundred_Part : Integer;
      Ten_Part : Integer;
      Unit_Part : Integer;
   begin
      Words := Null_Unbounded_String;

      if Num = 1000 then
         Words := Thousands;
         return;
      end if;

      if Num >= 100 then
         Hundred_Part := Num / 100;
         Append(Words, Hundreds(Hundred_Part));
         Num_Copy := Num mod 100;
         if Num_Copy > 0 then
            Append(Words, " and ");
         end if;
      end if;

      if Num_Copy >= 20 then
         Ten_Part := Num_Copy / 10;
         Append(Words, Tens(Ten_Part));
         Unit_Part := Num_Copy mod 10;
         if Unit_Part > 0 then
            Append(Words, "-" & Units(Unit_Part));
         end if;
      elsif Num_Copy >= 11 then
         Append(Words, Teens(Num_Copy - 10));
      elsif Num_Copy = 10 then
         Append(Words, Tens(1));
      else
         Append(Words, Units(Num_Copy));
      end if;
   end Number_To_Words;

   Total_Letters : Natural := 0;
   Words : Unbounded_String;

begin
   for I in 1 .. 1000 loop
      Number_To_Words(I, Words);
      Total_Letters := Total_Letters + Count_Letters(To_String(Words));
   end loop;

   Put_Line("Total letters used from 1 to 1000: " & Natural'Image(Total_Letters));
end Number_To_Words;