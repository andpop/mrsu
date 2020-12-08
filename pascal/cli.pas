program Cli;
uses 
    crt;
const
    FontColor = Green;
var
    i: integer;
begin
    TextColor(FontColor);
    for i:=0 to ParamCount do
    begin
        writeln(i,': ', ParamStr(i));
    end;

end.
