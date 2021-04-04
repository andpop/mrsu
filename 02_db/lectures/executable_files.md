## ����������� ����� � Windows � Unix-like ��������
� Windows ������������ ����� ������������ �� ��� ����������.
���������� ������, ����������� � �����������, �������� � ���������� ����� PATHEXT.
```
echo %PATHEXT%
.COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW 
```
���������� � ����������, ������� ��������� ����������� �����, �������� � ������� � ����� HKEY_LOCAL_MACHINE\SOFTWARE\Classes.
��������� ����� � ������� ������ assoc � ftype.
������ ��� PHP:
* �������� ���������� .PHP � ����� ���������� PATHEXT.
* ������ ������������ ���������� .php � ���������� ����� �����:
```
assoc .php=phpfile
```
* ������ �������, ������� ���������-������������� ����� ��������� ����� ���� phpfile:
```
ftype phpfile="C:\PHP\php.exe" -f "%1" -- %~2
```
���������� ���� ����� �������� PHP-�������� ����������� �� ����� ���������� ��� ������������� ��������� ����������� PHP ���� ��� ���������� .PHP, � ��� ��������� ����� �������� � ������ ��� ���������.

---

� ������� ���� ����������� ��������� ��������� �������, ������� ����� ���� ������� �������.

������ #24 ��������� �������

Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.php]
@="phpfile"
"Content Type"="application/php"

[HKEY_LOCAL_MACHINE\SOFTWARE\Classes\phpfile]
@="PHP Script"
"EditFlags"=dword:00000000
"BrowserFlags"=dword:00000008
"AlwaysShowExt"=""

[HKEY_LOCAL_MACHINE\SOFTWARE\Classes\phpfile\DefaultIcon]
@="C:\\PHP5\\php-win.exe,0"

[HKEY_LOCAL_MACHINE\SOFTWARE\Classes\phpfile\shell]
@="Open"

[HKEY_LOCAL_MACHINE\SOFTWARE\Classes\phpfile\shell\Open]
@="&Open"

[HKEY_LOCAL_MACHINE\SOFTWARE\Classes\phpfile\shell\Open\command]
@="\"C:\\PHP5\\php.exe\" -f \"%1\" -- %~2"
� ����� ����������� ������� ����� ���� �������� ���:

"C:\PHP Scripts\script" -arg1 -arg2 -arg3
���, ���� ��� ���� � ���������� ��������� "C:\PHP Scripts" PATH:
script -arg1 -arg2 -arg3