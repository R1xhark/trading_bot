#!/bin/bash

# Set the name of your Python script (change this to your script's name)
SCRIPT_NAME="gui_app.py"

# Check if pyinstaller is installed
if ! command -v pyinstaller &> /dev/null; then
    echo "Error: pyinstaller is not installed. Please install it via pip."
    exit 1
fi

# Create the standalone executable
pyinstaller --onefile "$SCRIPT_NAME"

# Check if the build was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to build the executable."
    exit 1
fi

# Display success message
echo "Successfully created the standalone executable \"$SCRIPT_NAME\".exe in the 'dist' directory."
exit 0
