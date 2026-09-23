#!/bin/bash

echo "======================================="
echo "=       Server Performance Stats      ="
echo "======================================="

get_cpu_usage() {
    echo "CPU Usage:"
    top -bn1 | grep "Cpu(s)" | \
    sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
    awk '{print "CPU Usage: " 100 - $1"%"}'
    echo "---------------------------------------"
}

get_memory_usage(){
    echo "Memory Usage:"
    free -h | awk '/Mem:/ {printf "Used: %s / Total: %s (%.2f%%)\n", $3, $2, $2/$3 *100.0}'
    echo "---------------------------------------"
}

get_disk_usage(){
    echo "Disk Usage:"
    df -h --total | awk '/total/ {printf "Used: %s / Total: %s (%.2f%%)\n", $3, $2, $5}'
    echo "---------------------------------------"
}

get_top_cpu_processes(){
    echo "Top 5 Processes by CPU usage:"
    ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6 
    echo "---------------------------------------"
}

list_top_memory_processes() {
    echo -e "=== Top 5 Processes by Memory Usage ==="
    ps -eo pid,comm,%mem --sort=-%mem | head -n 6
    echo "---------------------------------------"
}

gather_additional_stats() {
    echo -e "\n=== Additional Stats ==="
    echo "Hostname: $(hostname)"
    echo "Operating System: $(lsb_release -d | cut -f2-)"
    echo "System Uptime: $(uptime -p)"
    echo "Load Average (1, 5, 15 mins): $(cat /proc/loadavg | awk '{print $1, $2, $3}')"
    echo "Currently Logged In Users: $(who | wc -l)"
    echo "Failed Login Attempts: $(grep "Failed password" /var/log/auth.log | wc -l)"
}

get_cpu_usage
get_memory_usage
get_disk_usage
get_top_cpu_processes
list_top_memory_processes
gather_additional_stats