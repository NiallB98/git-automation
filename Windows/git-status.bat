@echo off
cd %~dp0

git add .
echo ^>^>^> git status
git status
git reset

echo[
echo DONE
echo[
echo[

pause