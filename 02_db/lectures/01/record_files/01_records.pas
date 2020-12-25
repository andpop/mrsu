program record_example;
uses crt, sysutils;
type 
    TStudent = Record
        name: string[20];
        lastName: string[30];
        age: integer;
    end;

var 
    student, student2: TStudent;
    f: file of TStudent;
    choice: char;

function getRecordNumber(): integer;
var n, countRecords: integer;
begin
    countRecords := fileSize(f);

    write('Номер записи (1...' + intToStr(countRecords) + '): ');
    repeat
        readln(n);
    until (n >= 1) and (n <= countRecords);
    
    getRecordNumber := n;
end;

procedure addRecord;
var
    student: TStudent;
begin
    clrscr;

    write('Имя: ');
    readln(student.name);
    write('Фамилия: ');
    readln(student.lastName);
    write('Возраст: ');
    readln(student.age);
    
    seek(f, fileSize(f));
    write(f, student);
end;

procedure printRecord(n: integer; title: string);
var
    student: TStudent;
begin
    seek(f, n - 1);
    read(f, student);
    writeln(title);
    writeln('Имя: ', student.name);
    writeln('Фамилия: ', student.lastName);
    writeln('Возраст: ', student.age);

end;

procedure readRecord;
var
    student: TStudent;
    n: integer;
begin
    clrscr;
    n := getRecordNumber();
    clrscr;
    printRecord(n, 'Запись: ' + intToStr(n));

    writeln();
    writeln();
    write('<Enter> - return to main menu');
    readln();
end;

procedure listRecords;
var
    student: TStudent;
    countRecords: integer;
begin
    clrscr;
    
    countRecords := fileSize(f);
    writeln('Count records: ', countRecords);
    writeln('================================');

    seek(f, 0);
    while not eof(f) do
    begin
        read(f, student);
        writeln('Имя: ', student.name);
        writeln('Фамилия: ', student.lastName);
        writeln('Возраст: ', student.age);
        writeln('------------------------------');
    end;

    writeln();
    write('<Enter> - return to main menu');
    readln();
end;

procedure updateRecord;
var
    student: TStudent;
    n: integer;
begin
    clrscr;
    n := getRecordNumber();
    clrscr;
    printRecord(n, 'Запись: ' + intToStr(n));

    writeln();
    writeln();
    write('<Enter> - return to main menu');
    readln();
end;

procedure deleteRecord;
begin
    writeln('Deleting record');
end;

procedure openFile(fileName: string);
var
    code: integer;
begin
    assign(f, fileName);
    {$I-}
        reset(f);
    {$I+}
    code := IOResult;

    if code <> 0 then
    begin
        {$I-}
            rewrite(f);
        {$I+}
        code := IOResult;
        if code <> 0 then
        begin
            writeln('Open file error');
            halt;
        end;
    end;
end;

begin
    openFile('students.dat');

    repeat
        clrscr;
        writeln('(A)dd new record in file');
        writeln('(R)ead the record from file');
        writeln('(L)ist all records from file');
        writeln('(U)pdate the record in file');
        writeln('(D)elete the record from file');
        writeln('');
        writeln('(Q)uit');

        writeln('===============================');
        writeln();
        write('Your choice: ');
        readln(choice);

        choice := upcase(choice);
        case choice of 
            'A': addRecord;
            'R': readRecord;
            'L': listRecords;
            'U': updateRecord;
            'D': deleteRecord;
        end;

        writeln('=============================');
        writeln();
    until (choice = 'Q');

    halt;

    student.name := 'Иван';
    student.lastName := 'Петров';
    student.age := 20;

    with student2 do
    begin
        name := 'Анна';
        lastName := 'Сидорова';
        age := 19;
    end;

    writeln(student.name);
    writeln(student2.name);

    assign(f, 'students.dat');
    // rewrite(f);
    reset(f);
    seek(f, fileSize(f));
    write(f, student);
    write(f, student2);
    close(f);

    // reset(f);
    // seek(f, 0);
    // read(f, student2);
    // writeln(student2.name);
    // writeln(student2.lastName);
    // writeln(student2.age);
end.
