@echo off

:: Set the name of your Python script (change this to your script's name)
set SCRIPT_NAME=gui_app.py

:: Check if pyinstaller is installed
pyinstaller --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: pyinstaller is not installed. Please install it via pip.
    pause
    exit /b 1
)

:: Create the standalone executable
pyinstaller --onefile %SCRIPT_NAME%

:: Check if the build was successful
if %errorlevel% neq 0 (
    echo Error: Failed to build the executable.
    pause
    exit /b 1
)

:: Display success message
echo Successfully created the standalone executable "%SCRIPT_NAME%".exe in the 'dist' directory.
pause
exit /b 0
