#!/bin/bash

token=g
rm ./reps.txt
for student in $(cat students-list.txt); do
   echo "202M_Testing_$student" >> reps.txt
done

for repo in $(cat reps.txt) ; do
    echo "Make repo for $repo"

    curl -i -u andpop-mrsu:$token https://api.github.com/user/repos -d "{\"name\":\"$repo\",\"private\":false}"
done

# readarray repos < reps.txt
# echo ${repos[@]}
