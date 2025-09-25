#!/bin/bash

# 1. System Health Monitoring Script: 
# Develop a script that monitors the health of a Linux system. It should check CPU usage, memory usage, disk space, and running processes. If any of these metrics exceed predefined thresholds (e.g., CPU usage > 80%), the script should send an alert to the console or a log file. 

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print int($2 + $4)}')   # user+system CPU%
MEM=$(free | awk '/Mem:/ {print int($3/$2 * 100)}')            # memory usage %
DISK=$(df / | tail -1 | awk '{print int($5)}')                 # root disk usage %

echo "CPU: $CPU%  MEM: $MEM%  DISK: $DISK%"

[ "$CPU" -gt 80 ] && echo "ALERT: High CPU!" 
[ "$MEM" -gt 80 ] && echo "ALERT: High Memory!"
[ "$DISK" -gt 85 ] && echo "ALERT: Low Disk Space!"
exit 0