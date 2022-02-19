#!/bin/bash

BASE_DIR="/home/andrey/labs_302"

pwd=$PWD
echo $pwd

task_number=$1

for student in $(cat "${pwd}/students_1.txt"); do
    echo "----------------------------------------------------------------------------------"
    echo $student
    student_dir="${BASE_DIR}/302_${student}"

    cd "${student_dir}"
    git fetch teacher master
    git merge teacher/master -m "Merging master from teacher repo"

    # cp "${pwd}/tasks/README.md" "${student_dir}/"
    # cp "${pwd}/tasks/Git_instruction.md" "${student_dir}/"
    # cp "${pwd}/tasks/PHP_instruction.md" "${student_dir}/"
    cp "${pwd}/tasks/task02_1.md" "${student_dir}/task02.md"
    # cp -R "${pwd}/tasks/PHPUnit_example" "${student_dir}/"

    git add -A
    git commit -m "Add task02"
    git push teacher master
    cd "${pwd}"
done
