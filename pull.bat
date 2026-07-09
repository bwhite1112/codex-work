@echo off
setlocal

cd /d "%~dp0"

echo.
echo === Git pull helper ===
echo Repository: %CD%
echo.

for /f "delims=" %%B in ('git branch --show-current') do set "BRANCH=%%B"
if "%BRANCH%"=="" (
    echo Could not detect current branch.
    pause
    exit /b 1
)

echo Branch: %BRANCH%
echo.

git status --short
if errorlevel 1 (
    echo.
    echo Git status failed. Make sure this folder is a Git repository.
    pause
    exit /b 1
)

echo.
git diff --quiet
if errorlevel 1 (
    echo You have local unstaged changes.
    echo Please commit, stash, or discard them before pulling.
    pause
    exit /b 1
)

git diff --cached --quiet
if errorlevel 1 (
    echo You have staged changes.
    echo Please commit, stash, or unstage them before pulling.
    pause
    exit /b 1
)

git rev-parse --abbrev-ref --symbolic-full-name @{u} >nul 2>&1
if errorlevel 1 (
    echo.
    echo No upstream branch found.
    echo Try running: git branch --set-upstream-to=origin/%BRANCH% %BRANCH%
    pause
    exit /b 1
)

echo.
echo Pulling latest changes with fast-forward only...
git pull --ff-only
if errorlevel 1 (
    echo.
    echo git pull failed. The branch may have diverged or there may be a conflict.
    echo If this is expected, run git pull manually and resolve it.
    pause
    exit /b 1
)

echo.
echo Pull completed successfully.
pause
