#!/bin/bash

BASE_DIR="/home/andrey/labs/302_OOP"

pwd=$PWD
echo $pwd

task_number=$1

for student in $(cat "${pwd}/students_1.txt"); do
    echo "----------------------------------------------------------------------------------"
    echo $student
    student_dir="${BASE_DIR}/${student}"

    cd "${student_dir}"
    git fetch teacher master
    git merge teacher/master -m "Merging master from teacher repo"

    # cp "${pwd}/../tasks/README.md" "${student_dir}/"
    # cp "${pwd}/../tasks/Git_instruction.md" "${student_dir}/"
    # cp "${pwd}/../tasks/PHP_instruction.md" "${student_dir}/"
    # cp "${pwd}/../tasks/Pull_Request_flow.pdf" "${student_dir}/"
    cp "${pwd}/../tasks/task03_1.md" "${student_dir}/task03.md"
    # cp "${pwd}/../tasks/task08.md" "${student_dir}/task08.md"
    # mkdir -p "${student_dir}/Task06/"
    # cp -R "${pwd}/../tasks/Task06_2" "${student_dir}/Task06/Task06_1"
    # rm -rf "${student_dir}/Task06"
    # cp -R "${pwd}/../tasks/PHPUnit_example" "${student_dir}/"

    git add -A
    git commit -m "Add task03"
    git push teacher master
    cd "${pwd}"
done
