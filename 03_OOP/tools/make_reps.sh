#!/bin/bash

token=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
rm ./reps.txt
for student in $(cat students-list.txt); do
   echo "302_OOP_$student" >> reps.txt
done

for repo in $(cat reps.txt) ; do
    echo "Make repo for $repo"

    curl -i -u andpop-mrsu:$token https://api.github.com/user/repos -d "{\"name\":\"$repo\",\"private\":false}"
done

# readarray repos < reps.txt
# echo ${repos[@]}
