#!/bin/bash

STREAM="301_OOP"
BASE_DIR="/home/andrey/labs/302_OOP"
# REPS_FILE="reps.txt"
STUDENTS_FILE="./301.txt"

# TEACHER_PROFILE="https://github.com/andpop-mrsu"
# Привязку к удаленному репозиторию делаем по SSH, а не по HTTPS
TEACHER_PROFILE="git@github.com-mrsu:andpop-mrsu"
TEACHER_EMAIL="andrvpopov@gmail.com"

for student in $(cat $STUDENTS_FILE) ; do
    student_dir="${BASE_DIR}/${STREAM}_$student"
    if ! [ -d $student_dir ] ; then
        echo "Make directory: for ${student_dir}"
        mkdir $student_dir
    fi
    cd $student_dir
    git init
    git config user.email $TEACHER_EMAIL
    git remote add teacher "${TEACHER_PROFILE}/${STREAM}_${student}.git"
    git fetch teacher
    git checkout --track teacher/master
done
