#!/bin/bash

BASE_DIR="/home/andrey/labs_402"

pwd=$PWD
echo $pwd

task_number=$1

for student in $(cat "${pwd}/students_1.txt"); do
    echo "----------------------------------------------------------------------------------"
    echo $student
    student_dir="${BASE_DIR}/402_${student}"

    cd "${student_dir}"
    # git fetch teacher
    # git merge -m "Merging from teacher repo"

    cp "${pwd}/tasks/README.md" "${student_dir}/"
    cp "${pwd}/tasks/Git_instruction.md" "${student_dir}/"
    cp "${pwd}/tasks/task01_1.md" "${student_dir}/task01.md"
    # cp "${pwd}/tasks/task0${task_number}.md" "${student_dir}/"

        # if [ -f "${pwd}/tasks/specification_0${task_number}_0${option}.md" ]; then
        #     cp "${pwd}/tasks/specification_0${task_number}_0${option}.md" "${student_dir}/"
        # fi


        git add -A
        git commit -m "Add task01"
        git push teacher master
        cd "${pwd}"
    done
