#!/bin/bash
# script to remove files from working tree
# run for **every file** you want to remove
cd LOCAL_FOLDER_OF_THE_REPOSITORY

declare -a StringArray=("Nomefile1" "nomefile2" "...")

for file in ${StringArray[@]}; do
	git filter-branch --force --index-filter \
  		"git rm --cached --ignore-unmatch FULL_PATH_TO_FOLDER_$file" \
  		--prune-empty --tag-name-filter cat -- --all
done


# THEN ADD THOSE FILES TO .gitignore
# don't forget to put a proper .gitignore beforehand
for file in ${StringArray[@]}; do
	echo $file >> .gitignore
done

git add .gitignore

# lastly, commit and push
git commit -m 'history cleansing'
git push