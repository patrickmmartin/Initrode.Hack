unit OutColours;

interface

procedure Red;
procedure Green;
procedure Grey;

implementation

uses
    Windows;


procedure Colour(AColour : Integer);
begin
  SetConsoleTextAttribute(GetStdHandle(
                          STD_OUTPUT_HANDLE),
                          AColour);
end;


procedure Red;
begin
  Colour(FOREGROUND_RED or FOREGROUND_INTENSITY);
end;

procedure Green;
begin
  Colour(FOREGROUND_GREEN or FOREGROUND_INTENSITY);
end;

procedure Grey;
begin
  Colour(FOREGROUND_BLUE or FOREGROUND_GREEN or FOREGROUND_RED);
end;


end.
