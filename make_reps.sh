#!/bin/bash
rm ./reps.txt
for student in $(cat students-list.txt)
do
   echo "402_$student" >> reps.txt
done
