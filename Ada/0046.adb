with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure Goldbach_Conjecture_Disproof is
   Max : constant := 10_000; -- Arbitrary large enough upper limit

   type Boolean_Array is array (Positive range <>) of Boolean;
   Prime_Flag : Boolean_Array(1 .. Max) := (others => True);

   function Is_Prime(N : Integer) return Boolean is
   begin
      if N <= 1 then return False; end if;
      return Prime_Flag(N);
   end Is_Prime;

   function Is_Composite(N : Integer) return Boolean is
   begin
      return N > 1 and not Is_Prime(N);
   end Is_Composite;

begin
   -- Sieve of Eratosthenes
   Prime_Flag(1) := False;
   for I in 2 .. Integer(Sqrt(Float(Max))) loop
      if Prime_Flag(I) then
         declare
            J : Integer := I * I;
         begin
            while J <= Max loop
               Prime_Flag(J) := False;
               J := J + I;
            end loop;
         end;
      end if;
   end loop;

   -- Search for smallest counterexample
   for N in 9 .. Max loop
      if N mod 2 = 1 and then Is_Composite(N) then
         declare
            Found : Boolean := False;
            S     : Integer := 1;
            Tmp   : Integer;
         begin
            while 2 * S * S <= N loop
               Tmp := N - 2 * S * S;
               if Tmp > 1 and then Is_Prime(Tmp) then
                  Found := True;
                  exit;
               end if;
               S := S + 1;
            end loop;

            if not Found then
               Put("Smallest counterexample: ");
               Put(N);
               New_Line;
               return;
            end if;
         end;
      end if;
   end loop;
end Goldbach_Conjecture_Disproof;