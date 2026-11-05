program Examples;
{$mode objfpc}{$H+}

{ Records group typed fields; arrays hold a fixed sequence. }
type
  TBook = record
    Title: string;
    Available: Boolean;
  end;
  TCatalog = array[1..3] of TBook;

var
  Books: TCatalog;
  Borrowed: TBook;
  I, AvailableCount: Integer;

// A const parameter lets the function inspect without modifying the record.
function LabelBook(const Item: TBook): string;
begin
  if Item.Available then
    Result := Item.Title + ' - on shelf'
  else
    Result := Item.Title + ' - on loan';
end;

// A var parameter deliberately permits changes to the caller's record.
procedure Borrow(var Item: TBook);
begin
  Item.Available := False;
end;

begin
  Books[1].Title := 'Dune';
  Books[1].Available := True;
  Books[2].Title := 'Emma';
  Books[2].Available := False;
  Books[3].Title := 'Sapiens';
  Books[3].Available := True;
  AvailableCount := 0;

  WriteLn('Neighborhood shelf');
  for I := Low(Books) to High(Books) do
  begin
    WriteLn(LabelBook(Books[I]));
    if Books[I].Available then
      Inc(AvailableCount);
  end;
  WriteLn('Available count: ', AvailableCount);

  { Record assignment copies the fields into a separate record. }
  Borrowed := Books[1];
  Borrow(Borrowed);
  WriteLn('Original: ', LabelBook(Books[1]));
  WriteLn('Updated: ', LabelBook(Borrowed));
end.
