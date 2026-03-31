#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: Raj Ratan | Reg No: 24BCE10959
# Description: Checks package installation status and prints an open-source philosophy note

PACKAGE="mysql-server"   # The package we are inspecting

# Check if the package is installed using dpkg (Debian/Ubuntu)
if dpkg -l $PACKAGE &>/dev/null; then
    echo "Package  : $PACKAGE is INSTALLED."
    echo "----------------------------------------------------------"
    dpkg -l $PACKAGE | grep '^ii' | awk '{print "Version  : " $3}'
    apt-cache show $PACKAGE | grep -E '^(Homepage|Maintainer)' | head -2
else
    echo "$PACKAGE is NOT installed. Run: sudo apt install $PACKAGE"
fi

echo ""
echo "--- Open Source Philosophy Note ---"

# Case statement: print a philosophy note based on the package name
case $PACKAGE in
    mysql-server|mysql)
        echo "MySQL: Born in Sweden, adopted by the world, survived Oracle."
        echo "The database that proved open source could power the entire web." ;;
    git)
        echo "Git: Born from proprietary revocation. Freedom by necessity." ;;
    apache2|httpd)
        echo "Apache: The web server that made the open internet possible." ;;
    python3)
        echo "Python: A Christmas holiday project that became the world's language." ;;
    vlc)
        echo "VLC: Written by students — proof that open tools outlive corporations." ;;
    *)
        echo "This is a free and open-source software package. Study its source." ;;
esac
