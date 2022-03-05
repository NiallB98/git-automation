#!/bin/bash

cd "$(dirname "$0")"

git add .
echo ">>> git status"
git status
git reset

echo
echo DONE
echo
echo
read -n 1 -s -r -p "Press any key to continue . . . "
