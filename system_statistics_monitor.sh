#!/bin/bash

echo "====================================="
echo "      System Statistics Monitor      "
echo "====================================="

echo -e "\n=== Memory Statistics ==="
free -h
echo -e "\nSwap Usage:"
swapon --show
echo -e "\nVirtual Memory Stats:"
vmstat 1 1

echo -e "\n=== CPU Information ==="
echo "CPU Usage:"
top -bn1 | grep "Cpu(s)" 
echo -e "\nLoad Average:"
uptime

echo -e "\n=== Disk Usage ==="
df -h

echo -e "\n=== Process Statistics ==="
echo "Total Processes:"
ps aux | wc -l
echo -e "\nTop 5 Memory-Consuming Processes:"
ps aux --sort=-%mem | head -6

echo -e "\n=== System Memory Details ==="
cat /proc/meminfo | grep -E "MemTotal|MemFree|MemAvailable|SwapTotal|SwapFree"

echo -e "\n=== Current Swappiness ==="
cat /proc/sys/vm/swappiness

echo "====================================="
