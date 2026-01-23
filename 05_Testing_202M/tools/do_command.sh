#!/bin/bash

BASE_DIR="/home/andrey/labs_402"

pwd=$PWD
echo $pwd

for student in $(cat "${pwd}/students-list.txt"); do
    echo "----------------------------------------------------------------------------------"
    echo $student
    student_dir="${BASE_DIR}/402_${student}"

    cd "${student_dir}"

    git pull teacher master
    cd "${pwd}"
done
