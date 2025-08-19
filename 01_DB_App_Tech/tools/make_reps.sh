#!/bin/bash

token=12345678
rm ./reps.txt
for student in $(cat students_401.txt); do
   echo "401_DBAppTech_$student" >> reps.txt
done

for repo in $(cat reps.txt) ; do
    echo "Make repo for $repo"

    curl -i -u andpop-mrsu:$token https://api.github.com/user/repos -d "{\"name\":\"$repo\",\"private\":false}"
done

# readarray repos < reps.txt
# echo ${repos[@]}
