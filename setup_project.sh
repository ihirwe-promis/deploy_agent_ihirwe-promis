#!/bin/bash
trap 'echo "Interrupt detected. Archiving..."
tar -czf "${project_dir}_archive.tar.gz" "$project_dir"
rm -rf "$project_dir"
exit 1' SIGINT

echo "Enter project name:"
read input
project_dir="attendance_tracker_${input}"
if [ -d "$project_dir" ]; then
  echo "Error: Project already exists"
  exit 1
fi
mkdir "$project_dir"
mkdir "$project_dir/Helpers"
mkdir "$project_dir/reports"
cp attendance_checker.py "$project_dir/"
cp assets.csv "$project_dir/Helpers/"
cp config.json "$project_dir/Helpers/"
cp reports.log "$project_dir/reports/"
echo "Do you want to update thresholds? (y/n)"
read choice
echo "Enter warning threshold:"
read warning
echo "Enter failure threshold:"
read failure

if ! [[ "$warning" =~ ^[0-9]+$ ]] || ! [[ "$failure" =~ ^[0-9]+$ ]]; then
  echo "Invalid input. Must be numbers."
  exit 1
fi
sed -i "s/\"warning\": [0-9]\+/\"warning\": $warning/" "$project_dir/Helpers/config.json"
sed -i "s/\"failure\": [0-9]\+/\"failure\": $failure/" "$project_dir/Helpers/config.json"
if command -v python3 &>/dev/null; then
  echo "Python3 detected: $(python3 --version)"
else
  echo "Warning: Python3 not found"
fi
if [ -f "$project_dir/attendance_checker.py" ] && \
   [ -f "$project_dir/Helpers/assets.csv" ] && \
   [ -f "$project_dir/Helpers/config.json" ] && \
   [ -f "$project_dir/reports/reports.log" ]; then
   echo "Project setup completed successfully"
else
   echo "Error: Structure incomplete"
   exit 1
fi
echo "Project setup complete."
echo "Press Ctrl+C now to test the trap..."
sleep 15
