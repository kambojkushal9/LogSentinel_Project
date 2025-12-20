#!/bin/bash

# --- CONFIGURATION ---
# We use 'realpath' to find the log file 3 levels up
# If realpath is missing on your system, we use the relative path directly
LOG_FILE="../../../dummy.log"
PATTERN_FILE="./patterns.txt"
REPORT_FILE="../../../threat_report.log"

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

echo "-----------------------------------------------------"
echo "[INIT] Log Sentinel Started at $TIMESTAMP"
echo "[INIT] Looking for log file at: $LOG_FILE"
echo "-----------------------------------------------------"

# 1. Check if log file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "[ERROR] File NOT FOUND at $LOG_FILE"
    echo "[HINT] Make sure you are running this script from inside 'src/main/scripts'"
    exit 1
fi

# 2. Initialize Report
echo "Security Scan Report - $TIMESTAMP" > $REPORT_FILE
echo "-----------------------------------------------------" >> $REPORT_FILE

# 3. The Main Loop
while IFS= read -r threat_pattern; do

    echo "[SCANNING] Searching for: '$threat_pattern'"

    # Count matches
    count=$(grep -c "$threat_pattern" "$LOG_FILE")

    if [ $count -gt 0 ]; then
        echo "   -> [ALERT] Found $count matches!"

        # Add to report
        echo "THREAT DETECTED: $threat_pattern" >> $REPORT_FILE
        echo "Count: $count matches" >> $REPORT_FILE
        grep "$threat_pattern" "$LOG_FILE" >> $REPORT_FILE
        echo "-----------------------------------" >> $REPORT_FILE
    else
        echo "   -> [OK] No threats found."
    fi

done < "$PATTERN_FILE"

echo "-----------------------------------------------------"
echo "[DONE] Scan Complete. Report saved to root folder."
echo "-----------------------------------------------------"
