program sqlite_example;

uses
  CRT, Classes, SysUtils, SQLDB, SQLite3Conn;

var
  sqlite3: TSQLite3Connection;
  dbTrans: TSQLTransaction;
  dbQuery: TSQLQuery;
  slNames: TStringList;

function sqlDBError(const msg: string): string;
begin
  // error message reformatting
  result := 'ERROR: '+StringReplace(msg,'TSQLite3Connection : ','',[]);
end;

function openDB(const dbName: string): boolean;
begin
  // create components
  sqlite3 := TSQLite3Connection.Create(nil);
  dbTrans := TSQLTransaction.Create(nil);
  dbQuery := TSQLQuery.Create(nil);
  slNames := TStringList.Create;

  // setup components
  sqlite3.Transaction   := dbTrans;
  dbTrans.Database      := sqlite3;
  dbQuery.Transaction   := dbTrans;
  dbQuery.Database      := sqlite3;
  slNames.CaseSensitive := false;

  // setup db
  sqlite3.DatabaseName := dbName;
  sqlite3.HostName     := 'localhost';
  sqlite3.CharSet      := 'UTF8';

  // open db
  if FileExists(dbName) then
  try
    sqlite3.Open;
    result := sqlite3.Connected;
  except
    on E: Exception do
    begin
      sqlite3.Close;
      writeln(sqlDBError(E.Message));
    end;
  end
  else
  begin
    result := false;
    writeln('Database file "',dbName,'" is not found.');
  end;
end;

procedure closeDB;
begin
  // disconnect
  if sqlite3.Connected then
  begin
    dbTrans.Commit;
    dbQuery.Close;
    sqlite3.Close;
  end;

  // release
  slNames.Free;
  dbQuery.Free;
  dbTrans.Free;
  sqlite3.Free;
end;

type 
    TStudent = Record
        name: string[20];
        lastName: string[30];
        age: integer;
        gender: char;
    end;

var 
    choice: char;
    sqlite3: TSQLite3Connection;
    dbTrans: TSQLTransaction;
    dbQuery: TSQLQuery;
    slNames: TStringList;

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
    sql: string;
begin
    clrscr;
    student := inputStudentData;

    sql := 'INSERT INTO students (name,lastName, age, gender) VALUES';
    sql := sql + '(' + student.name + ', ' + student.lastName + ', ' + student.age + ', '  + student.gender + ')';
    writeln(sql);
    // saveRecord(fileSize(f) + 1, student);
end;



// ========================= READ  =======================
procedure readRecordByLastname;
var
    lastName: string;
    isFound: boolean;
    student: TStudent;
    sql: string;
begin
    clrscr;
    lastName := inputLastName();
    clrscr;

    sql: = 'SELECT * FROM students WHERE lastName = ' + student.lastName;


    writeln();
    writeln();
    write('<Enter> - вернуться в главное меню');
    readln();
end;

procedure listRecords;
var
    student: TStudent;
    countRecords, recordNumber: integer;
    sql: string;
begin
    clrscr;
    
    sql := 'SELECT * FROM students';
    // countRecords := fileSize(f);
    // writeln('Всего записей: ', countRecords);

    // recordNumber := 0;
    // while not eof(f) do
    // begin
    //     read(f, student);
    //     inc(recordNumber);

    //     writeln('--------------------- ', recordNumber, ' --');
    //     writeln('Имя: ', student.name);
    //     writeln('Фамилия: ', student.lastName);
    //     writeln('Пол: ', student.gender);
    //     writeln('Возраст: ', student.age);
    // end;

    writeln();
    write('<Enter> - вернуться в главное меню');
    readln();
end;


// ========================= UPDATE  =======================
procedure updateRecordByNumber;
var
    student: TStudent;
    n: integer;
    lastName: string;
    sql: string;
begin
    clrscr;
    n := inputRecordNumber();
    clrscr;

    clrscr;
    lastName := inputLastName();
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
    // openFile('students.dat');
    openDB('students.db');

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

    closeDB;
end.
