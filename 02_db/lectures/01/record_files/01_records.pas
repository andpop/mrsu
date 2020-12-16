program record_example;
uses crt;
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

procedure addRecord;
begin
    writeln('Adding record');
end;

procedure readRecord;
begin
    writeln('Reading record');
end;

procedure listRecords;
begin
    writeln('Listing record');
end;

procedure updateRecord;
begin
    writeln('Updating record');
end;

procedure deleteRecord;
begin
    writeln('Deleting record');
end;

begin
    repeat
        // clrscr;
        writeln('(A)dd new record in file');
        writeln('(R)ead the record from file');
        writeln('(L)ist all records from file');
        writeln('(U)pdate the record in file');
        writeln('(D)elete the record from file');
        writeln('=============================');
        writeln('(Q)uit');

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
