@echo on
setlocal

:: Set the path to your Python executable (replace 'python' with the correct path)
set PYTHON_EXECUTABLE=python

:: List the required Python packages/libraries
set REQUIRED_PACKAGES=Trading212 pandas scikit-learn schedule requests

:: Function to check if a package is installed
:CheckPackage
    echo Checking for %1...
    %PYTHON_EXECUTABLE% -c "import %1" 2>nul
    if errorlevel 1 (
        echo Installing %1...
        %PYTHON_EXECUTABLE% -m pip install %1
        if errorlevel 1 (
            echo Failed to install %1. Please install it manually.
            exit /b 1
        ) else (
            echo Successfully installed %1.
        )
    ) else (
        echo %1 is already installed.
    )
    exit /b 0

:: Check and install required packages
for %%p in (%REQUIRED_PACKAGES%) do (
    call :CheckPackage %%p
)

:: Run the main.py script
echo Running the project...
%PYTHON_EXECUTABLE% main.py

:: End of the script
echo Script execution completed.
pause
