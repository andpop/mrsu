#!/bin/bash

BASE_DIR="/home/andrey/labs/DBMS"
REPS_FILE="reps.txt"

pwd=$PWD
echo $pwd

# task_number=$2

# for student in $(cat "${pwd}/list4.txt"); do
for student in $(cat "$REPS_FILE"); do
    echo "----------------------------------------------------------------------------------"
    echo $student
    student_dir="${BASE_DIR}/$student"

    cd "${student_dir}"
    git fetch teacher master
    git merge teacher/master -m "Merging master from teacher repo"

    cp "${pwd}/../tasks/README.md" "${student_dir}/"
    cp -R "${pwd}/../tasks/dataset" "${student_dir}/"
    cp "${pwd}/../tasks/task01.md" "${student_dir}/task01.md"
    cp "${pwd}/../tasks/Git_instruction.md" "${student_dir}/"
    # cp "${pwd}/../tasks/task06.md" "${student_dir}/task06.md"
    # cp "${pwd}/../tasks/specification_04.md" "${student_dir}/specification.md"

    git add -A
    git commit -m "Add task01"
    git push teacher master
    cd "${pwd}"
done
