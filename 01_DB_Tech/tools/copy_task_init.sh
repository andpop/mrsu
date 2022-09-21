#!/bin/bash

BASE_DIR="/home/andrey/labs_402"

pwd=$PWD
echo $pwd

task_number=$2

for student in $(cat "${pwd}/students-list_2.txt"); do
# for student in $(cat "${pwd}/list5.txt"); do
    echo "----------------------------------------------------------------------------------"
    echo $student
    student_dir="${BASE_DIR}/402_${student}"

    cd "${student_dir}"
    git fetch teacher master
    git merge teacher/master -m "Merging master from teacher repo"

    # cp "${pwd}/tasks/README.md" "${student_dir}/"
    # cp "${pwd}/tasks/task01.md" "${student_dir}/"
    cp "${pwd}/../Git_instruction.md" "${student_dir}/"
    # cp "${pwd}/tasks/*.xls" "${student_dir}/"
    cp "${pwd}/../tasks/task02.md" "${student_dir}/task02.md"
    # cp "${pwd}/tasks/specification_01.md" "${student_dir}/specification.md"

    git add -A
    git commit -m "Change task02"
    git push teacher master
    cd "${pwd}"
done
