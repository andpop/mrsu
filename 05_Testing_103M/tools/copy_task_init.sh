#!/bin/bash

BASE_DIR="/home/andrey/labs/Testing"

pwd=$PWD
echo $pwd

task_number=$1

for student in $(cat "${pwd}/students-list_103M.txt"); do
    echo "----------------------------------------------------------------------------------"
    echo $student
    student_dir="${BASE_DIR}/103M_Testing_${student}"

    cd "${student_dir}"
    git fetch teacher master
    git merge teacher/master -m "Merging master from teacher repo"

    # cp "${pwd}/../tasks/README.md" "${student_dir}/"
    # cp "${pwd}/../tasks/Git_instruction.md" "${student_dir}/"
    cp "${pwd}/../tasks/task02.md" "${student_dir}/task02.md"
    # cp "${pwd}/../tasks/task02.md" "${student_dir}/task02.md"
    # cp "${pwd}/../tasks/task03.md" "${student_dir}/task03.md"
    # cp "${pwd}/../tasks/report_example_1.pdf" "${student_dir}/"
    # cp "${pwd}/../tasks/report_example_2.pdf" "${student_dir}/"
    # cp -R "${pwd}/../tasks/PHPUnit_example" "${student_dir}/"

    git add -A
    git commit -m "Add task 02"
    git push teacher master
    cd "${pwd}"
done
