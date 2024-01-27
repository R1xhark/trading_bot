#!/bin/bash

# Set the path to your Python executable (replace 'python' with the correct path)
PYTHON_EXECUTABLE=python

# List the required Python packages/libraries
REQUIRED_PACKAGES=("Trading212" "pandas" "scikit-learn" "schedule" "requests")

# Function to check if a package is installed
CheckPackage() {
    echo "Checking for $1..."
    if ! "$PYTHON_EXECUTABLE" -c "import $1" 2>/dev/null; then
        echo "Installing $1..."
        if ! "$PYTHON_EXECUTABLE" -m pip install $1; then
            echo "Failed to install $1. Please install it manually."
            exit 1
        else
            echo "Successfully installed $1."
        fi
    else
        echo "$1 is already installed."
    fi
}

# Check and install required packages
for package in "${REQUIRED_PACKAGES[@]}"; do
    CheckPackage "$package"
done

# Run the main.py script
echo "Running the project..."
"$PYTHON_EXECUTABLE" main.py

# End of the script
echo "Script execution completed."
