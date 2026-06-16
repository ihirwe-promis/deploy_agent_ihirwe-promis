# Student Attendance Tracker Setup

# Description

"setup_project.sh" is a shell script that automatically sets up the Student Attendance Tracker project. It creates the required folders and files, lets the user update attendance thresholds, checks if Python 3 is installed, and makes sure all files are created correctly.

If the user presses `Ctrl+C` while the script is running, the script creates an archive of the project and deletes the incomplete folder.

# Requirements
* Linux
* Bash
* Python 3

# How to Run

```bash
chmod +x setup_project.sh
./setup_project.sh
```

# Archive Feature
Run the script and press `Ctrl+C`. The script will:
1. Create an archive of the project.
2. Delete the incomplete project folder.
3. Exit safely.

