program record_example;

uses crt, sysutils;

type 
    TStudent = Record
        name: string[20];
        lastName: string[30];
        age: integer;
    end;

var 
    f: file of TStudent;
    choice: char;

function getStudentData(): TStudent;
var
    student: TStudent;
begin
    write('Имя: ');
    readln(student.name);
    write('Фамилия: ');
    readln(student.lastName);
    write('Возраст: ');
    readln(student.age);

    getStudentData := student;
end;

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

    student := getStudentData;
    
    saveRecord(fileSize(f) + 1, student);
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
    n: integer;
begin
    clrscr;
    n := getRecordNumber();
    clrscr;
    printRecord(n, 'Запись: ' + intToStr(n));

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
        writeln('Возраст: ', student.age);
    end;

    writeln();
    write('<Enter> - вернуться в главное меню');
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
    writeln('-------------------------------------');

    student := getStudentData;

    saveRecord(n, student);
    writeln('-------------------------------------');
    writeln('Запись сохранена в файле');
    write('<Enter> - вернуться в главное меню');
    readln();
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

procedure deleteRecord;
var
    buffer: TStudent;
    tempFile: file of TStudent;
    deleteRecordNumber, currentRecordNumber: integer;
begin
    clrscr;
    deleteRecordNumber := getRecordNumber();
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

begin
    openFile('students.dat');

    repeat
        clrscr;
        writeln('1. Добавить запись в файл');
        writeln('2. Отобразить одну запись');
        writeln('3. Показать все записи');
        writeln('4. Обновить запись');
        writeln('5. Удалить запись');
        writeln('');
        writeln('6. Выход');

        writeln('===============================');
        writeln();
        write('Ваш выбор: ');
        readln(choice);

        choice := upcase(choice);
        case choice of 
            '1': addRecord;
            '2': readRecord;
            '3': listRecords;
            '4': updateRecord;
            '5': deleteRecord;
        end;

        writeln('');
        writeln();
    until (choice = '6');

    halt;

end.
