#!/bin/bash

# Telegram bot token and chat ID
TOKEN="7900860977:AAFMZMVUsQ2G2MDWMEUfVGFYWxra_HGLWTY"
CHAT_ID="7637009568"

# Gather system information
HOSTNAME=$(hostname)
IP_ADDRESS=$(hostname -I | awk '{print $1}')
UPTIME=$(uptime -p)
LOAD_AVG=$(cat /proc/loadavg | awk '{print $1", "$2", "$3}')
MEMORY=$(free -h | awk '/Mem:/ {print $3 " used / " $2}')
DISK=$(df -h / | awk 'NR==2 {print $3 " used / " $2}')
USERS=$(who | awk '{print $1}' | sort | uniq | tr '\n' ', ')
KERNEL=$(uname -r)

# Construct the sci-fi styled message
MESSAGE="🚀 *SYSTEM STATUS REPORT*\n
🛡️ *Unit Designation*: $HOSTNAME\n
⏳ *Operational Duration*: $UPTIME\n
🖥️ *Core Load*: $LOAD_AVG\n
💾 *Memory Reserves*: $MEMORY\n
📀 *Storage Modules*: $DISK\n
👨‍💻 *Active Users*: $USERS\n
🛠️ *Kernel Protocol*: $KERNEL\n
⚡ Status: *STABLE*. Awaiting further directives from Command."

# Send the message to Telegram
/usr/bin/curl -s --header "Content-Type: application/json" \
  --request POST \
  --data "{\"chat_id\":\"${CHAT_ID}\",\"text\":\"${MESSAGE}\",\"parse_mode\":\"Markdown\"}" \
  "https://api.telegram.org/bot${TOKEN}/sendMessage"

