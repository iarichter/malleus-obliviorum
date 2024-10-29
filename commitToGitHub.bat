@echo off
echo Committing with message: %*
git add .
git commit -m "%*"
git push origin main