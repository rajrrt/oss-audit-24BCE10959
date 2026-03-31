#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: Raj Ratan | Reg No: 24BCE10959
# Note on aliases: 'alias mysqlq="mysql -u root -p"' creates a shortcut for login.
# Aliases are defined in ~/.bashrc for persistence across terminal sessions.

echo "===================================="
echo "  OPEN SOURCE MANIFESTO GENERATOR   "
echo "===================================="
echo ""

# Gather user input interactively using read -p
read -p "1. One open-source tool you use every day: " TOOL
read -p "2. In one word, what does freedom mean to you? " FREEDOM
read -p "3. One thing you would build and share freely: " BUILD

# Get current date for the manifesto header
DATE=$(date '+%d %B %Y')

# Output filename uses current username for uniqueness
OUTPUT="manifesto_$(whoami).txt"

# Write manifesto to file — > creates/overwrites, >> appends
echo "Open Source Manifesto — $DATE" > "$OUTPUT"
echo "-------------------------------------------" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Every day I rely on $TOOL — a tool built openly and shared freely." >> "$OUTPUT"
echo "To me, freedom means $FREEDOM — and that is what open source represents." >> "$OUTPUT"
echo "It is the right to learn from and build upon the work of those who came before." >> "$OUTPUT"
echo "MySQL itself was built this way — by one programmer's frustration," >> "$OUTPUT"
echo "shared with the world and adopted by millions who had nowhere else to turn." >> "$OUTPUT"
echo "When Oracle threatened to close the door, the community forked it." >> "$OUTPUT"
echo "One day I will build $BUILD and release it openly," >> "$OUTPUT"
echo "so someone I will never meet can stand on my shoulders, as I stood on others." >> "$OUTPUT"
echo "That is the open source promise. That is my commitment." >> "$OUTPUT"

echo ""
echo "Manifesto saved to: $OUTPUT"
echo ""
cat "$OUTPUT"

