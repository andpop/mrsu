#!/bin/bash

BASE_DIR="/home/andrey/labs/PHP"

pwd=$PWD
echo $pwd

task_number=$2

for student in $(cat "${pwd}/reps.txt"); do
# for student in $(cat "${pwd}/group4.txt"); do
    echo "----------------------------------------------------------------------------------"
    echo $student
    student_dir="${BASE_DIR}/${student}"

    cd "${student_dir}"
    git fetch teacher master
    git merge teacher/master -m "Merging master from teacher repo"

    # cp "${pwd}/../tasks/README.md" "${student_dir}/"
    cp "${pwd}/../tasks/task04.md" "${student_dir}/"
    # cp "${pwd}/../Git_instruction.md" "${student_dir}/"
    #
    # cp "${pwd}/../tasks/spec_4.md" "${student_dir}/specification.md"

    git add -A
    # git commit -m "Change game specification"
    git commit -m "Add task04"
    git push teacher master
    cd "${pwd}"
done
