#!/bin/bash

# Replace with your actual token and chat ID
token="replace with token"
chat="id"

event="$1"

# Gather system information
hostname=$(hostname)
ip_address=$(hostname -I | awk '{print $1}')
uptime=$(uptime -p)
load_avg=$(cat /proc/loadavg | awk '{print $1", "$2", "$3}')
memory=$(free -h | awk '/Mem:/ {print $3 " used / " $2}')
disk=$(df -h / | awk 'NR==2 {print $3 " used / " $2}')
logged_in_users=$(who | awk '{print $1}' | sort | uniq | tr '\n' ', ')
users=${logged_in_users%} # Remove trailing comma and space
kernel=$(uname -r)

case "$event" in
  startup)
    subj="🛸 SYSTEM INITIATED"
    message="🟢 SYSTEM ONLINE
    Hostname: $hostname
    Kernel: $kernel
    Memory: $memory
    Disk: $disk
    Load: $load_avg
    Logged-in Users: $users
    Mission control confirms operational status. Awaiting further directives. 🚀"
    ;;
  shutdown)
    subj="⚠️ SYSTEM DECOMMISSION"
    message="🔴 SYSTEM SHUTDOWN
    Hostname: $hostname
    Uptime: $uptime
    Memory: $memory
    Disk: $disk
    Load: $load_avg
    Logged-in Users: $users
    Core systems entering shutdown protocol. Powering down for maintenance or standby. 🛑"
    ;;
  reboot)
    subj="♻️ SYSTEM REBOOT"
    message="🟡 SYSTEM REBOOT
    Hostname: $hostname
    Uptime: $uptime
    Memory: $memory
    Disk: $disk
    Load: $load_avg
    Logged-in Users: $users
    System core is cycling. Reboot sequence initiated. All units, prepare for reactivation. 🔄"
    ;;
  *)
    echo "Unknown event: $event"
    exit 1
    ;;
esac

# Send the alert using curl
/usr/bin/curl -s --header "Content-Type: application/json" \
  --request POST \
  --data "{\"chat_id\":\"${chat}\",\"text\":\"${subj}\n${message}\"}" \
  "https://api.telegram.org/bot${token}/sendMessage"

