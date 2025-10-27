#!/bin/bash

BASE_DIR="/home/andrey/labs/DB"
REPS_FILE="reps.txt"

pwd=$PWD
echo $pwd

# task_number=$2

# for student in $(cat "${pwd}/students-list2.txt"); do
# for student in $(cat "${pwd}/list5.txt"); do
for student in $(cat "$REPS_FILE"); do
    echo "----------------------------------------------------------------------------------"
    echo $student
    student_dir="${BASE_DIR}/$student"
    # student_dir="${BASE_DIR}/303_${student}"

    cd "${student_dir}"
    git fetch teacher master
    git merge teacher/master -m "Merging master from teacher repo"

    # cp "${pwd}/../tasks/README.md" "${student_dir}/"
    # cp -R "${pwd}/../tasks/dataset" "${student_dir}/"
    # cp "${pwd}/../tasks/task01.md" "${student_dir}/task01.md"
    # cp "${pwd}/../tasks/Git_instruction.md" "${student_dir}/"
    # cp "${pwd}/tasks/*.xls" "${student_dir}/"
    cp "${pwd}/../tasks/task05.md" "${student_dir}/task05.md"
    # cp "${pwd}/tasks/task09_5.md" "${student_dir}/task09.md"
    # cp "${pwd}/../tasks/specification_05.md" "${student_dir}/specification.md"

    git add -A
    git commit -m "Add task05"
    git push teacher master
    cd "${pwd}"
done
