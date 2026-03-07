#!/bin/bash

BASE_DIR="/home/andrey/labs/DB"
REPS_FILE="reps.txt"

pwd=$PWD
echo $pwd

# task_number=$2

# for student in $(cat "${pwd}/students-list2.txt"); do
# for student in $(cat "${pwd}/list4.txt"); do
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
    # cp "${pwd}/../tasks/task02.md" "${student_dir}/task02.md"
    cp "${pwd}/../tasks/task03_1.md" "${student_dir}/task03.md"
    cp "${pwd}/../tasks/task04_1.md" "${student_dir}/task04.md"
    # cp "${pwd}/../tasks/task05.md" "${student_dir}/task05.md"
    # cp "${pwd}/../tasks/task06.md" "${student_dir}/task06.md"
    cp "${pwd}/../tasks/task07_1.md" "${student_dir}/task07.md"
    cp "${pwd}/../tasks/task08_1.md" "${student_dir}/task08.md"
    # cp "${pwd}/tasks/task09_5.md" "${student_dir}/task09.md"
    # cp "${pwd}/../tasks/specification_04.md" "${student_dir}/specification.md"

    git add -A
    git commit -m "Add task02-8"
    git push teacher master
    cd "${pwd}"
done
