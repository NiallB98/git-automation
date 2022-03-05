@echo off
:choose
echo ^>^>^> git status
git status
set /p choice="Enter a file to add to this commit (Leave empty to move on to committing): "
IF NOT "%choice%" == "" git add "%choice%" && set "choice=" && goto :choose

:askcomment
set /p cmnt="Enter a commit comment: "
IF "%cmnt%" == "" echo ERROR: No comment given^! && echo[ && goto :askcomment
set /p desc="Enter a commit description: "
cd %~dp0

echo[
echo ^>^>^> git status
git status
IF "%desc%" == "" echo ^>^>^> git commit -m "%cmnt%" && git commit -m "%cmnt%"
IF NOT "%desc%" == "" echo ^>^>^> git commit -m "%cmnt%" -m "%desc%" && git commit -m "%cmnt%" -m "%desc%"
git push origin main

echo[
echo DONE
echo[
echo[
pause