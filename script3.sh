#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: Raj Ratan | Reg No: 24BCE10959
# Description: Audits permissions and disk usage for important system directories

# Array of standard system directories to audit
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "Directory Audit Report"
echo "----------------------------------------------"
printf "%-20s %-8s %-24s\n" "Directory" "Size" "Perms / Owner / Group"
echo "----------------------------------------------"

# Loop through each directory in the array
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
    # Extract permissions, owner and group using awk
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        # Get disk usage; suppress errors for permission-denied subdirs
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        printf "%-20s %-8s %-24s\n" "$DIR" "${SIZE:-N/A}" "$PERMS"
    else
        echo "$DIR does not exist on this system."
    fi
done

# Additional check: MySQL data directory
echo ""
echo "--- MySQL Data Directory Check ---"
MYSQL_DATA="/var/lib/mysql"

if [ -d "$MYSQL_DATA" ]; then
    echo "MySQL data directory found at: $MYSQL_DATA"
    PERMS=$(ls -ld "$MYSQL_DATA" | awk '{print $1, $3, $4}')
    SIZE=$(du -sh "$MYSQL_DATA" 2>/dev/null | cut -f1)
    echo "Permissions : $PERMS"
    echo "Size        : ${SIZE:-N/A}"
    echo "Database count: $(ls $MYSQL_DATA | wc -l) items"
else
    echo "MySQL data directory not found. Is MySQL installed?"
fi

