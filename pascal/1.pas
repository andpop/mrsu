program hello;
var 
    { a: integer = 135; }
    a, b: integer;

procedure p1(x: integer; var y: integer);
begin
    x:=1;
    y:=2;
end;

begin
    a:=10;
    b:=20;

    p1(a, b);
    writeln(a);
    writeln(b);
    
    {
    readln(x);
    if x < 0 then
        x:= -x
    else 
    x:= 1000;
    writeln('x=', x);
    }
end.
