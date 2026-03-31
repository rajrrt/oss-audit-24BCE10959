#!/bin/bash
# Script 1: System Identity Report
# Author: Raj Ratan | Reg No: 24BCE10959 | Course: Open Source Software
# Description: Displays a formatted system welcome screen with OS, user, and MySQL info

STUDENT_NAME="Raj Ratan"
SOFTWARE_CHOICE="MySQL"

# Gather system information using command substitution
KERNEL=$(uname -r)
DISTRO=$(cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '"')
USER_NAME=$(whoami)
HOME_DIR=$HOME
UPTIME=$(uptime -p)
CURRENT_DATE=$(date '+%d %B %Y, %H:%M')

# Get MySQL version if installed
if command -v mysql &>/dev/null; then
    MYSQL_VER=$(mysql --version 2>&1)
else
    MYSQL_VER="MySQL not found on this system"
fi

# Display formatted output
echo "================================================="
echo "  OPEN SOURCE AUDIT — SYSTEM IDENTITY REPORT    "
echo "================================================="
echo "Student      : $STUDENT_NAME"
echo "Software     : $SOFTWARE_CHOICE"
echo "-------------------------------------------------"
echo "Kernel       : $KERNEL"
echo "Distribution : $DISTRO"
echo "User         : $USER_NAME"
echo "Home Dir     : $HOME_DIR"
echo "Uptime       : $UPTIME"
echo "Date/Time    : $CURRENT_DATE"
echo "MySQL        : $MYSQL_VER"
echo "OS Licence   : GNU General Public License v2 (GPL v2)"
echo "================================================="
