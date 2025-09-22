#!/bin/bash
token=12345678
rm ./reps.txt
for student in $(cat students-list_302.txt); do
   echo "302_DBTech_$student" >> reps_302.txt
done

# for repo in $(cat reps.txt) ; do
#     echo "Make repo for $repo"

#     curl -i -u andpop-mrsu:$token https://api.github.com/user/repos -d "{\"name\":\"$repo\",\"private\":false}"
# done

# readarray repos < reps.txt
# echo ${repos[@]}
