#!/bin/bash

BASE_DIR="/home/andrey/labs_402"

pwd=$PWD
echo $pwd

task_number=$1

for student in $(cat "${pwd}/students_1.txt"); do
    echo "----------------------------------------------------------------------------------"
    echo $student
    student_dir="${BASE_DIR}/402_${student}"

    cd "${student_dir}"
    git fetch teacher master
    git merge teacher/master -m "Pull from teacher"

    # cp "${pwd}/tasks/README.md" "${student_dir}/"
    cp "${pwd}/tasks/Git_instruction.md" "${student_dir}/"
    cp "${pwd}/tasks/PHP_instruction.md" "${student_dir}/"
    cp "${pwd}/tasks/task02_1.md" "${student_dir}/task02.md"

    git add -A
    git commit -m "Add task02"
    git push teacher master
    cd "${pwd}"
done
