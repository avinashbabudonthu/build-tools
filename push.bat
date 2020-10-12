@echo off
cd /d %cd%
echo -----------------------------------------------
echo %cd%
echo -----------------------------------------------
git status
git add .
git commit -m "one place %date% %time%"
git push
pause