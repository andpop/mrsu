program List;

type
    itemPtr = ^item;

    item = Record
        data: integer;
        next: itemPtr;
    end;

var
    firstItem: itemPtr;

begin
    new(firstItem);
    firstItem^.data := 10;
    new(firstItem^.next);
    firstItem^.next^.data := 20;
    new(firstItem^.next^.next);
    firstItem^.next^.next^.data := 30;
    firstItem^.next^.next^.next := nil;

    writeln(firstItem^.data);
    writeln(firstItem^.next^.data);
    writeln(firstItem^.next^.next^.data);
end.
