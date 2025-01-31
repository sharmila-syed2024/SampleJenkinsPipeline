#!/bin/bash                                                                                                                                                                                                                                                                                                             # Script Name: system_admin.sh                                                                                                                              # Author: Sharmila Syed                                                                                                                                     # Description: Performs system information, file and directory management, process management, user and group management, networking, and system resource tasks.

# Function: System Information
function system_info {
    echo "==== System Information ===="
    echo "Current Date and Time: $(date)"
    echo "Hostname: $(hostname)"
    echo "Operating System and Version:"
    lsb_release -a 2>/dev/null || cat /etc/os-release
    echo "System Uptime: $(uptime -p)"
    echo "Current User : $(whoami)"
    echo
}
# Function: File and Directory Management
function file_dir_management {
    echo "==== File and Directory Management ===="
    TEMP_DIR=$(mktemp -d)
    echo "Temporary Directory Created: $TEMP_DIR"

    TEMP_FILE="$TEMP_DIR/sample.txt"
    touch "$TEMP_FILE"
    echo "Temporary File Created: $TEMP_FILE"

    echo "Hello, this is a test file." > "$TEMP_FILE"
    echo "Contents of the File:"
    cat "$TEMP_FILE"

    COPY_DIR="$TEMP_DIR/copy"
    mkdir "$COPY_DIR"
    cp "$TEMP_FILE" "$COPY_DIR/"
    echo "File Copied to: $COPY_DIR"

    MOVE_DIR="$TEMP_DIR/move"
    mkdir "$MOVE_DIR"
    mv "$COPY_DIR/sample.txt" "$MOVE_DIR/"
    echo "File Moved to: $MOVE_DIR"

    find "$TEMP_DIR" -name "sample.txt" -print
    ls -l "$TEMP_DIR"

    echo "Disk Usage of Temporary Directory:"
    du -sh "$TEMP_DIR"


    chmod 644 "$MOVE_DIR/sample.txt"
    echo "Changed Permissions of File: $MOVE_DIR/sample.txt"

    rm -rf "$TEMP_DIR"
    echo "Temporary Directory Deleted"
    echo
}

# Function: Process Management
function process_management {
    echo "==== Process Management ===="
    echo "Currently Running Processes:"
    ps aux | head -n 10

    sleep 100 &
    BG_PID=$!
    echo "Simulated Background Process (PID: $BG_PID)"
    kill $BG_PID
    echo "Background Process Killed"
    echo
}

# Function: User and Group Management
function user_group_management {
    echo "==== User and Group Management ===="
    echo "Groups for User $(whoami):"
    groups
    echo
}
# Function: Networking
function networking {
    echo "==== Networking ===="
    echo "Pinging google.com:"
    ping -c 3 google.com

    echo "Network Interface Information:"
    ip addr

    echo "Listening Network Sockets:"
    netstat -lntp
    echo
}

# Function: System Resources
function system_resources {
    echo "==== System Resources ===="
    echo "Disk Space Usage:"
    df -h

    echo "Memory Usage:"
    free -h
    echo
}

# Main Script Execution
system_info
file_dir_management
process_management
user_group_management
networking
system_resources

echo "Enter the name for the temporary directory:"
read USER_DIR_NAME
TEMP_DIR="$USER_DIR_NAME"
mkdir "$TEMP_DIR"
echo "Created temporary directory: $TEMP_DIR"
