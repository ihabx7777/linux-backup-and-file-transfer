#!/bin/bash 

PROJECT_DIR="$HOME/linux-admin-project"
REPORT_DIR="$PROJECT_DIR/reports"

mkdir -p "$REPORT_DIR"

REPORT_FILE="$REPORT_DIR/system_report_$(date +%Y-%d_%H-%M-%S).txt"

{
      echo "======================================="
      echo "           LINUX SYSTEM REPORT"
      echo "======================================="

      echo 
      echo  "Date and Time:"
      date 

      echo 
      echo "Hostname:"
      hostname

      echo 
      echo "Operating System:"
      cat /etc/os-release | grep -E '^(PRETTY_NAME)='

      echo 
      echo  "Uptime:"
      uptime 

      echo 
      echo "CPU Information:"
      nproc

      echo 
      echo "Memory Usage:"
      free -h 

      echo 
      echo "Disk Usage:"
      df -h
      
      echo 
      echo "Top Processes:"
      ps aux --sort=-%mem | head -n 6

} > "$REPORT_FILE"

    echo "System report created sucessfully"
    echo "Report location: $REPORT_FILE"
