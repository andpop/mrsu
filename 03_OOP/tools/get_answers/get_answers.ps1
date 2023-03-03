
$n = 0
# Скопировать решения из всех папок в отдельные файлы с номерами
dir | % { $test_file = $_.name+"/Task02/Test.php"; $n++; $target = "./Task02_$n.php"; copy -Path $test_file -Destination $target }
sed -e '/amespace/d' -i *.php
