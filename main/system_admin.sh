#!/bin/bash
echo "hello azure batch"

echo "==================================="
echo "Linux Batch Scripting: Assignment 1"
echo "=================================="

# -------------------------------
# System Information
# -------------------------------

echo "System Information:"
echo "-----------------------"

# Display current date and time
echo "1. Current Date and Time: $(date)"

# Display system's hostname
echo "2. Hostname: $(hostname)"


# Display OS and version
echo "3. Operating System and Version:"
if command -v lsb_release >/dev/null 2>&1; then
    lsb_release -a
else
    cat /etc/os-release
fi


# Display system uptime
echo "4. System Uptime: $(uptime -p)"

# Display current user
echo "5. Current User: $(whoami)"



# -------------------------------
# File and Directory Management
#-------------------------------

echo "-----------------------------"
echo "File and Directory Management:"
echo "-----------------------------"

# Create a temporary directory
TEMP_DIR="/tmp/tempdirashwini_$$"
mkdir "$TEMP_DIR"
echo "1. Created temporary directory: $TEMP_DIR"


# Create a new file in the temporary directory
TEMP_FILE="$TEMP_DIR/samplead.txt"
touch "$TEMP_FILE"
echo "2. Created file: $TEMP_FILE"

# Write a line of text to the file
echo "3. Hello, this is a test file created by system_admin.sh!" > "$TEMP_FILE"
echo "3. Wrote text to file: $TEMP_FILE"


# Display the contents of the file
echo "4. Contents of $TEMP_FILE:"
cat "$TEMP_FILE"

#Copying the file to another location
echo "5. Copying the file to another location..."
cp "$TEMP_FILE" "$TEMP_DIR/samplead_copy.txt"
echo "File copied to: $TEMP_DIR/testfile_copy.txt"

# Moving the file to a different directory
echo "6. Moving the file to a different directory..."
NEW_DIR="$TEMP_DIR/new_dir"
mkdir "$NEW_DIR"
mv "$TEMP_FILE" "$NEW_DIR/"
echo "File moved to: $NEW_DIR/samplead.txt"

#Deleting the file
echo "7. Deleting the file..."
rm "$NEW_DIR/samplead.txt"
echo "File deleted."

# Use find to locate a specific file
echo "8. Searching for 'samplead.txt' in /TEMP_DIR:"
find "$TEMP_DIR" -name "samplead.txt"

# List files in the copy directory
echo "9. Listing files in $TEMP_DIR:"
ls -l "$TEMP_DIR"

# Display disk usage of the temporary directory
echo "10. Disk usage of $TEMP_DIR:"
du -sh "$TEMP_DIR"

# Change file permissions
chmod 600 "$TEMP_DIR/samplead.txt"
echo "11. Changed file permissions of $TEMP_DIR/samplead.txt to 600"

# -------------------------------
# Process Management
# -------------------------------
echo "-------------------"
echo "Process Management:"
echo "-------------------"

# List currently running processes
echo "1. Currently running processes:"
ps aux | head -10

# Simulate sending a signal to a process (create a background process first)
echo "2. Simulating process signal..."
sleep 60 &
BG_PROCESS=$!
echo "Background process ID: $BG_PROCESS"
kill -9 "$BG_PROCESS"
echo "Background process $BG_PROCESS killed."

# -------------------------------
# User and Group Management
# -------------------------------
echo "--------------------------"
echo "User and Group Management:"
echo "--------------------------"

# Display groups of the current user
echo "1. Groups of the current user:"
groups

# -------------------------------
# Networking
# -------------------------------
echo "-----------"
echo "Networking:"
echo "-----------"

# Test network connectivity
PING_HOST="google.com"
echo "1. Pinging $PING_HOST:"
ping -c 3 "$PING_HOST"

# Display network interface information
echo "2. Network Interface Information:"
if command -v ifconfig >/dev/null 2>&1; then
    ifconfig
else
    ip addr
fi

# Display listening network sockets
echo "3. Listening network sockets:"
netstat -lntp

# -------------------------------
# System Resources
# -------------------------------
echo "-----------------"
echo "System Resources:"
echo "-----------------"

# Display disk space usage
echo "1. Disk Space Usage:"
df -h

# Display memory usage
echo "2. Memory Usage:"
free -h

echo
echo "=============================="
echo "Script Execution Complete!"
echo "=============================="
