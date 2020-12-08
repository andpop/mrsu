program List2;

type
    itemPtr = ^item;

    item = Record
        data: integer;
        next: itemPtr;
    end;

var
    list: itemPtr;
    n: integer;

procedure addItem(var list: itemPtr; data: integer);
var
    firstItem: itemPtr;
begin
   new(firstItem);
   firstItem^.data := data;
   firstItem^.next := list;
   list := firstItem;
end;


procedure printList(list: itemPtr);
begin
    repeat
        writeln(list^.data);
        list := list^.next;
    until (list = nil);
end;


function getLastItem(list: itemPtr): itemPtr;
begin
    {
    repeat
        writeln(list^.data);
        list := list^.next;
    until (list = nil);
    }
    getLastItem := nil;
end;


begin
    list := nil;
    while not SeekEof do
    begin
        read(n);
        addItem(list, n);
    end;

    writeln('============================');
    printList(list);

end.
