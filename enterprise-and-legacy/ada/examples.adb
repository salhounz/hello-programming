with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Examples is
   -- Records combine fields of different, statically checked types.
   type Book is record
      Title     : Unbounded_String;
      Available : Boolean := True;
   end record;

   type Book_Array is array (Positive range <>) of Book;
   Books : constant Book_Array :=
     ((To_Unbounded_String ("Dune"), True),
      (To_Unbounded_String ("Emma"), False),
      (To_Unbounded_String ("Sapiens"), True));

   -- Functions return values; nested declarations are local here.
   function Label (Item : Book) return String is
   begin
      if Item.Available then
         return To_String (Item.Title) & " - on shelf";
      else
         return To_String (Item.Title) & " - on loan";
      end if;
   end Label;

   function Available_Count (Items : Book_Array) return Natural is
      Count : Natural := 0;
   begin
      for Item of Items loop
         if Item.Available then
            Count := Count + 1;
         end if;
      end loop;
      return Count;
   end Available_Count;

begin
   Put_Line ("Neighborhood shelf");
   for Item of Books loop
      Put_Line (Label (Item));
   end loop;
   Put_Line ("Available count:" & Natural'Image (Available_Count (Books)));

   -- A declare block limits the lifetime and visibility of a variable.
   declare
      Borrowed : Book := Books (Books'First);
   begin
      Borrowed.Available := False;
      Put_Line ("Original: " & Label (Books (Books'First)));
      Put_Line ("Updated: " & Label (Borrowed));
   end;

   -- Array attributes avoid assuming a particular lower bound.
   Put_Line ("Catalog rows:" & Natural'Image (Books'Length));
end Examples;
