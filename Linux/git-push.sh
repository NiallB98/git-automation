#!/bin/bash

echo ">>> git status"
git status
read -p "Enter a file to add to this commit (Leave empty to move on to committing): " choice

firsttime=true
while [ "$firsttime" = true ] || [[ ! -z "${choice}" ]]; do
	firsttime=false
	git add "$choice"
	unset choice
	echo ">>> git status"
	
	git status
	read -p "Enter a file to add to this commit (Leave empty to move on to committing): " choice
done

cd "$(dirname "$0")"

read -p "Enter a commit comment: " cmnt
while [[ -z "${cmnt}" ]]; do
	echo "ERROR: No comment given!"
	read -p "Enter a commit comment: " cmnt
done

read -p "Enter a commit description: " desc

echo
echo ">>> git status"
git status
if [[ -z "${desc}" ]]; then
	echo '>>> git commit -m "'${cmnt}'"'
	git commit -m "${cmnt}"
else
	echo '>>> git commit -m "'${cmnt}'" -m "'${desc}'"'
	git commit -m "${cmnt}" -m "${desc}"
fi

git push origin main

echo
echo DONE
echo
echo
read -n 1 -s -r -p "Press any key to continue . . . "
