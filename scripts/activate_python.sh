#!/bin/bash

venv_path="venv/bin/activate"

# Check if the virtual environment exists
if [ -f "$venv_path" ]; then
    # Source the activate script to activate the virtual environment
    source "$venv_path"
    echo "Virtual environment activated."
else
    echo "Virtual environment not found at $venv_path."
fi
