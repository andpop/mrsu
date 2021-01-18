program record_example;

uses crt, sysutils;

type 
    TStudent = Record
        name: string[20];
        lastName: string[30];
        age: integer;
        gender: char;
    end;

var 
    f: file of TStudent;
    choice: char;

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

function inputStudentData(): TStudent;
var
    student: TStudent;
begin
    write('Имя: ');
    readln(student.name);
    write('Фамилия: ');
    readln(student.lastName);
    write('Пол: ');
    readln(student.gender);
    write('Возраст: ');
    readln(student.age);

    inputStudentData := student;
end;

function inputRecordNumber(): integer;
var n, countRecords: integer;
begin
    countRecords := fileSize(f);

    write('Номер записи (1...' + intToStr(countRecords) + '): ');
    repeat
        readln(n);
    until (n >= 1) and (n <= countRecords);
    
    inputRecordNumber := n;
end;

function inputLastName(): string;
var lastName: string;
begin
    write('Фамилия: ');
    readln(lastName);
    
    inputLastName := lastName;
end;

// ========================= CREATE =======================
procedure saveRecord(n: integer; buffer: TStudent);
begin
    seek(f, n - 1);
    write(f, buffer);
end;

procedure addRecord;
var
    student: TStudent;
begin
    clrscr;

    student := inputStudentData;
    
    saveRecord(fileSize(f) + 1, student);
end;



// ========================= READ  =======================
procedure readRecordByNumber;
var
    n: integer;
    student: TStudent;
begin
    clrscr;
    n := inputRecordNumber();
    clrscr;

    seek(f, n - 1);
    read(f, student);
    
    writeln('Запись: ' + intToStr(n));
    writeln('Имя: ', student.name);
    writeln('Фамилия: ', student.lastName);
    writeln('Пол: ', student.gender);
    writeln('Возраст: ', student.age);

    writeln();
    writeln();
    write('<Enter> - вернуться в главное меню');
    readln();
end;

procedure readRecordByLastname;
var
    lastName: string;
    isFound: boolean;
    student: TStudent;
begin
    clrscr;
    lastName := inputLastName();
    clrscr;

    seek(f, 0);
    isFound := false;
    while not eof(f) do
    begin
        read(f, student);
        if (student.lastName = lastName) then
        begin
            isFound := true;
            break;
        end;
    end;

    if (isFound) then
    begin
        writeln('Имя: ', student.name);
        writeln('Фамилия: ', student.lastName);
        writeln('Пол: ', student.gender);
        writeln('Возраст: ', student.age);
    end
    else
        writeln('Фамилия ', lastName, ' в списке не найдена');

    writeln();
    writeln();
    write('<Enter> - вернуться в главное меню');
    readln();
end;

procedure listRecords;
var
    student: TStudent;
    countRecords, recordNumber: integer;
begin
    clrscr;
    
    countRecords := fileSize(f);
    writeln('Всего записей: ', countRecords);

    seek(f, 0);
    recordNumber := 0;
    while not eof(f) do
    begin
        read(f, student);
        inc(recordNumber);

        writeln('--------------------- ', recordNumber, ' --');
        writeln('Имя: ', student.name);
        writeln('Фамилия: ', student.lastName);
        writeln('Пол: ', student.gender);
        writeln('Возраст: ', student.age);
    end;

    writeln();
    write('<Enter> - вернуться в главное меню');
    readln();
end;


// ========================= UPDATE  =======================
procedure updateRecordByNumber;
var
    student: TStudent;
    n: integer;
begin
    clrscr;
    n := inputRecordNumber();
    clrscr;


    seek(f, n - 1);
    read(f, student);
    
    writeln('Запись: ' + intToStr(n));
    writeln('Имя: ', student.name);
    writeln('Фамилия: ', student.lastName);
    writeln('Пол: ', student.gender);
    writeln('Возраст: ', student.age);
    writeln('-------------------------------------');

    student := inputStudentData;

    saveRecord(n, student);
    writeln('-------------------------------------');
    writeln('Запись сохранена в файле');
    write('<Enter> - вернуться в главное меню');
    readln();
end;


// ========================= DELETE  =======================
procedure deleteRecordByNumber;
var
    buffer: TStudent;
    tempFile: file of TStudent;
    deleteRecordNumber, currentRecordNumber: integer;
begin
    clrscr;
    deleteRecordNumber := inputRecordNumber();
    clrscr;

    assign(tempFile, 'tmp.dat');
    rewrite(tempFile);

    seek(f, 0);
    currentRecordNumber := 0;

    while not eof(f) do
    begin
        read(f, buffer);
        inc(currentRecordNumber);

        if currentRecordNumber <> deleteRecordNumber then
        begin
            write(tempFile, buffer);
        end;
    end;

    close(tempFile);
    close(f);
    erase(f);
    rename(tempFile, 'students.dat');

    openFile('students.dat');

    writeln('Deleting record');
end;

// ========================= main program  =======================
begin
    openFile('students.dat');

    repeat
        clrscr;
        writeln('1. Добавить запись в файл (Create)');
        writeln();
        writeln('2. Найти запись по номеру (Read)');
        writeln('3. Найти запись по фамилии (Read)');
        writeln('4. Показать все записи (Read)');
        writeln();
        writeln('5. Обновить запись по номеру (Update)');
        writeln();
        writeln('6. Удалить запись по номеру (Delete)');
        writeln('');
        writeln('7. Выход');

        writeln('===============================');
        writeln();
        write('Ваш выбор: ');
        readln(choice);

        choice := upcase(choice);
        case choice of 
            '1': addRecord;
            '2': readRecordByNumber;
            '3': readRecordByLastName;
            '4': listRecords;
            '5': updateRecordByNumber;
            '6': deleteRecordByNumber;
        end;

        writeln('');
        writeln();
    until (choice = '7');

end.
