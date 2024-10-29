@echo off
echo Committing with message: %1
git add .
git commit -m "%1"
git push origin main