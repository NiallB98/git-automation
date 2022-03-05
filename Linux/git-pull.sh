#!/bin/bash

cd "$(dirname "$0")"

echo ">>> git pull origin main"
git pull origin main

echo
echo DONE
echo
echo

read -n 1 -s -r -p "Press any key to continue . . . "
