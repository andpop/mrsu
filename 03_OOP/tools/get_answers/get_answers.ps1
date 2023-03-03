
$n = 0
# Скопировать решения из всех папок в отдельные файлы с номерами
dir | % { $test_file = $_.name+"/Task02/Test.php"; if (Test-Path -Path $test_file) {$n++; $target = "./Task02_$n.php"; copy -Path $test_file -Destination $target }}
sed -e '/amespace/d' -i *.php

$n = 0
# Скопировать решения из всех папок в отдельные файлы с номерами
dir | % { $test_file = $_.name+"/Task02/Fraction.php"; if (Test-Path -Path $test_file) {$n++; $target = "./Fraction_$n.php"; copy -Path $test_file -Destination $target }}
sed -e '/amespace/d' -i *.php
