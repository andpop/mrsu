#!/bin/bash

BASE_DIR="/home/andrey/labs/402_DBTech"

pwd=$PWD
echo $pwd

task_number=$2

for student in $(cat "${pwd}/students-list.txt"); do
# for student in $(cat "${pwd}/option_5.txt"); do
    echo "----------------------------------------------------------------------------------"
    echo $student
    student_dir="${BASE_DIR}/402_DBTech_${student}"

    cd "${student_dir}"
    git fetch teacher master
    git merge teacher/master -m "Merging master from teacher repo"

    # cp "${pwd}/../tasks/README.md" "${student_dir}/"
    # cp "${pwd}/../tasks/task01.md" "${student_dir}/"
    # cp "${pwd}/../Git_instruction.md" "${student_dir}/"
    # cp "${pwd}/tasks/*.xls" "${student_dir}/"
    #
    cp "${pwd}/../tasks/task06.md" "${student_dir}/task06.md"
    cp "${pwd}/../tasks/task07.md" "${student_dir}/task07.md"
    cp "${pwd}/../tasks/task08.md" "${student_dir}/task08.md"
    # cp "${pwd}/../tasks/specification_cli_05.md" "${student_dir}/specification_cli.md"

    git add -A
    # git commit -m "Add CLI specification"
    git commit -m "Add tasks 6-8"
    git push teacher master
    cd "${pwd}"
done
