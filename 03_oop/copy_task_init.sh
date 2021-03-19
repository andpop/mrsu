#!/bin/bash

BASE_DIR="/home/andrey/labs_402"

pwd=$PWD
echo $pwd

task_number=$1

for student in $(cat "${pwd}/students-list.txt"); do
    echo "----------------------------------------------------------------------------------"
    echo $student
    student_dir="${BASE_DIR}/402_${student}"

    cd "${student_dir}"
    git fetch teacher master
    git merge teacher/master -m "Merging master from teacher repo"

    # cp "${pwd}/tasks/README.md" "${student_dir}/"
    # cp "${pwd}/tasks/Git_instruction.md" "${student_dir}/"
    # cp "${pwd}/tasks/PHP_instruction.md" "${student_dir}/"
    cp "${pwd}/tasks/task05.md" "${student_dir}/task05.md"
    # cp -R "${pwd}/tasks/PHPUnit_example" "${student_dir}/"

    git add -A
    git commit -m "Change task05"
    git push teacher master
    cd "${pwd}"
done
