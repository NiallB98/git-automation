:choose
@echo on
git status
@echo off
set /p choice="Enter a file to add to this commit (Leave empty to move on to committing): "
IF NOT "%choice%" == "" git add "%choice%" && set "choice=" && goto :choose

:askcomment
set /p cmnt="Enter a commit comment: "
IF "%cmnt%" == "" echo "ERROR: No comment given!" && echo[ && goto :askcomment
set /p desc="Enter a commit description: "
cd %~dp0

@echo on
git status
@echo off
IF "%desc%" == "" @echo on && git commit -m "%cmnt%"
@echo off
IF NOT "%desc%" == "" @echo on && git commit -m "%cmnt%" -m "%desc%"
git push origin main

@echo off
echo[
echo DONE
echo[
echo[
pause