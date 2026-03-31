#!/bin/bash
# Script 4: Log File Analyzer
# Usage: ./log_analyzer.sh /var/log/mysql/error.log [keyword]
# Author: Raj Ratan | Reg No: 24BCE10959

LOGFILE=$1
KEYWORD=${2:-"error"}   # Default keyword is 'error' if not provided
COUNT=0

# Validate that a log file argument was provided
if [ -z "$LOGFILE" ]; then
    echo "Usage: $0 <logfile> [keyword]"
    exit 1
fi

# Check the file exists and is a regular file
if [ ! -f "$LOGFILE" ]; then
    echo "Error: $LOGFILE not found."
    exit 1
fi

# Check if the file is empty — do-while style retry concept
if [ ! -s "$LOGFILE" ]; then
    echo "Warning: $LOGFILE is empty. Nothing to analyse."
    exit 0
fi

echo "Analysing : $LOGFILE"
echo "Keyword   : $KEYWORD"
echo "----------------------------------------------"

# Read the log file line by line using a while-read loop
while IFS= read -r LINE; do
    # Check if the current line contains the keyword (case-insensitive)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))   # Increment counter using arithmetic expansion
    fi
done < "$LOGFILE"

echo "Keyword '$KEYWORD' found $COUNT time(s) in $LOGFILE"
echo ""

# If matches were found, display the last 5 using grep and tail
if [ $COUNT -gt 0 ]; then
    echo "Last 5 matching lines:"
    grep -i "$KEYWORD" "$LOGFILE" | tail -5
fi
