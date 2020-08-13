#!/bin/bash

token=14114e26612df5133c39331f9cbdd45b7048c398

rm ./reps.txt
for student in $(cat students-list.txt); do
   echo "402_$student" >> reps.txt
done

for repo in $(cat reps.txt) ; do
    echo "Make repo for $repo"

    curl -i -u andpop-mrsu:$token https://api.github.com/user/repos -d "{\"name\":\"$repo\",\"private\":false}"
done

# readarray repos < reps.txt
# echo ${repos[@]}
