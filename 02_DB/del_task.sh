#!/bin/bash

BASE_DIR="/home/andrey/labs_303"

pwd=$PWD
echo $pwd

task_number=$2

for student in $(cat "${pwd}/students-list1.txt"); do
# for student in $(cat "${pwd}/list5.txt"); do
    echo "----------------------------------------------------------------------------------"
    echo $student
    student_dir="${BASE_DIR}/303_${student}"

    cd "${student_dir}"
    git fetch teacher master
    git merge teacher/master -m "Merging master from teacher repo"

    # cp "${pwd}/tasks/README.md" "${student_dir}/"
    # cp "${pwd}/tasks/task03.md" "${student_dir}/"
    # cp "${pwd}/tasks/Git_instruction.md" "${student_dir}/"
    # cp "${pwd}/tasks/*.xls" "${student_dir}/"
    rm "${student_dir}/task03.md"
    # cp "${pwd}/tasks/specification_01.md" "${student_dir}/specification.md"

    git add -A
    git commit -m "Change task03"
    git push teacher master
    cd "${pwd}"
done
