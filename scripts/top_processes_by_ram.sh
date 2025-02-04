#!/bin/bash

echo "====================================="
echo "    Top Memory Usage Processes       "
echo "====================================="

# Show top 10 processes by memory usage
echo "Top 10 processes by RAM usage:"
ps aux --sort=-%mem | head -11

echo -e "\nDetailed memory usage by process:"
top -b -o +%MEM | head -17

echo -e "\nDetailed virtual memory statistics:"
vmstat 1 1

echo "====================================="
