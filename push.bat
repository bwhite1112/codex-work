@echo off
setlocal

cd /d "%~dp0"

echo.
echo === Git push helper ===
echo Repository: %CD%
echo.

git status --short
if errorlevel 1 (
    echo.
    echo Git status failed. Make sure this folder is a Git repository.
    pause
    exit /b 1
)

echo.
set /p COMMIT_MSG=Enter commit message: 

if "%COMMIT_MSG%"=="" (
    echo.
    echo Commit message is required. Nothing was changed.
    pause
    exit /b 1
)

git add -A
if errorlevel 1 (
    echo.
    echo git add failed.
    pause
    exit /b 1
)

git diff --cached --quiet
if not errorlevel 1 (
    echo.
    echo No staged changes to commit.
    pause
    exit /b 0
)

git commit -m "%COMMIT_MSG%"
if errorlevel 1 (
    echo.
    echo git commit failed.
    pause
    exit /b 1
)

git push
if errorlevel 1 (
    echo.
    echo git push failed. Check your network or GitHub login status.
    pause
    exit /b 1
)

echo.
echo Push completed successfully.
pause
