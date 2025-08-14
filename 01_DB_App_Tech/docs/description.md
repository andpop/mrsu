# Подготовка и проверка лабораторных работ с помощью сервиса GitHub

## Общая схема работы
* В профиле преподавателя на GitHub (у меня учетка andpop-mrsu) для каждого студента заводится свой репозиторий.
* В этот репозиторий выкладываются задания для выполнения.
* Студент делает форк этого репозитория в свой личный профиль на GitHub.
* Студент для каждого задания создает отдельную ветку в своем репозитории и делает запрос на включение (Pull Request, PR) этой ветки в репозиторий в профиле преподавателя.
* Преподаватель проверяет содержащееся в PR задание, комментирует работу (можно писать общие комментарии к PR или делать ревью кода) и принимает PR. Каталог с выполненным заданием автоматически добавляется в ветку master репозитория в профиле преподавателя.

Преимущества:
* Получение студентами практических навыков работы с Git и GitHub в технологии, использующейся при разработке open-source проектов.
* Полная прозрачность процесса, протоколирование действий, архив выполненных заданий и комментариев по ним.
* Возможность автоматизации процесса для преподавателя.

## Начальная подготовка репозиториев и локальных каталогов для студентов
* В файл students-list.txt вносятся ФИО студентов в транскрипции (Ivanov_AP).
* Репозитории для студентов создаются автоматически скриптом make_reps.sh (предварительно нужно зарегистрировать в профиле на GitHub новый access token). К ФИО студента добавляется префикс с номером группы.

```
#!/bin/bash

token=14114e26612df5133c39331f9cbdd45b7048c398

rm ./reps.txt
for student in $(cat students-list.txt); do
   echo "402_$student" >> reps.txt
done

for repo in $(cat reps.txt) ; do
    echo "Make repo for $repo"

    curl -i -u andpop-mrsu:$token https://api.github.com/user/repos -d "{\"name\":\"$repo\",\"private\":false}"
done
```

* Заводится каталог (~/labs__mrsu) для локальных репозиториев студентов. В этом каталоге скриптом make_dirs.sh для каждого студента создаются Git-репозитории, которые под алиасом teacher связываются с репозиториями в GitHub-профиле преподавателя.

```
#!/bin/bash

BASE_DIR="/home/andrey/labs_mrsu"
REPS_FILE="reps.txt"
# TEACHER_PROFILE="https://github.com/andpop-mrsu"
# Привязку к удаленному репозиторию делаем по SSH, а не по HTTPS
TEACHER_PROFILE="git@github.com-mrsu:andpop-mrsu"
TEACHER_EMAIL="andrvpopov@gmail.com"

for rep in $(cat $REPS_FILE) ; do
    student_dir="${BASE_DIR}/$rep"
    if ! [ -d $student_dir ] ; then
        echo "Make directory: for ${student_dir}"
        mkdir $student_dir
    fi
    cd $student_dir
    git init
    git config user.email $TEACHER_EMAIL
    git remote add teacher "${TEACHER_PROFILE}/${rep}.git"
    git fetch teacher
    git checkout --track teacher/master
done
```

* Если нужно, студенты распределяются по вариантам, ФИО заносятся в файлы option_1.txt, option_2.txt, option_3.txt, ...

## Добавление заданий в репозитории
* Новые задания подготавливаются локально в файле tasks/task0X.md (X - номер задания), затем скриптом copy_task.sh копируются в локальные каталоги и пушатся на GitHub.
* При запуске copy_task.sh первым параметром указываем номер задания.
```
#!/bin/bash

BASE_DIR="/home/andrey/labs_mrsu"

pwd=$PWD
echo $pwd
if ! [ -n "$1" ]; then 
    echo "Не указан номер задания"
    exit 1
fi

task_number=$1

for option in `seq 1 5`; do
    echo "Вариант $option"
    for student in $(cat "${pwd}/option_${option}.txt"); do
        echo "----------------------------------------------------------------------------------"
        echo $student
        student_dir="${BASE_DIR}/402_${student}"

        cd "${student_dir}"
        git fetch teacher
        git merge -m "Merging from teacher repo"

        cp "${pwd}/tasks/README.md" "${student_dir}/"
        cp "${pwd}/tasks/task0${task_number}.md" "${student_dir}/"

        if [ -f "${pwd}/tasks/specification_0${task_number}_0${option}.md" ]; then
            cp "${pwd}/tasks/specification_0${task_number}_0${option}.md" "${student_dir}/"
        fi


        git add -A
        git commit -m "Change task ${task_number}"
        git push teacher master
        cd "${pwd}"
    done
done
```

## Проверка заданий
* Список открытых PR в репозиториях преподавательского профиля на GitHub смотрим с помощью скрипта check_pull_requests.ps1 
-------------------------------------------
ToDo: 
1. Добавить авторизацию в запросе, чтобы можно было больше обращений к API делать.
2. Извлечь путь к репозиторию студента, чтобы потом добавить в `git remote add student`.
------------------------------------------
```
$studentDir = "/home/andrey/labs_mrsu/"
$teacherRepo = "https://api.github.com/repos/andpop-mrsu/" 
$headers = @{}
$headers.Add("Authorization", "Basic andpop-mrsu PAT-here!!!")

Get-ChildItem $studentDir -Attributes Directory | 
    ForEach-Object { 
        $response = Invoke-RestMethod -Uri "${teacherRepo}$($_.Name)/pulls" -Headers $headers
        $obj = ($response | Select-Object -Property @{label='repo';expression={$_.head.repo.name}}, number, title, created_at)
        $obj
    }
```

* Переходим в каталог студента, синхронизируемся с его репозиторием, сливаем его ветку Task0X с master.
```sh
cd ~/labs_mrsu/402_test
git checkout teacher master
git remote add student https://github.com/andpop/402_test.git
git fetch student
git merge student/Task0X
```
* Проверяем задание в локальном репозитории. 
* После проверки выгружаем master в репозиторий преподавательского профиля на GitHub
```sh
git push teacher master
```
* Pull Request при этом автоматически закроется.
