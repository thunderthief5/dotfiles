#!/bin/bash
#
# stop_services.sh
#
# Description:
#   This script automates the process of stopping multiple Docker services.
#   It navigates to predefined service directories and runs `docker compose down`
#   to gracefully stop all running containers.
#
# Usage:
#   Run this script from the terminal: ./stop_services.sh
#    Or set it as a cron job to run automatically at 00:55 AM every day right before the duplicati backup.
#
# Cron Job Setup:
#   1. Open crontab: crontab -e
#   2. Add the following line:
#      55 0 * * * /bin/bash /home/thunderthief/.bin/stop_services.sh >> /home/thunderthief/Apps/service_logs.txt 2>&1
#   3. Save and exit
#
# Requirements:
#   - Docker and Docker Compose must be installed on the system.
#   - The specified services must be set up in the defined directories.
#
# Author: [ThunderThief]
# Date: [05-Feb-25]

# Define the service directories
SERVICES=(
    "audiobookshelf" "code-server" "dash" "dozzle"
    "gitea" "hoarder" "homarr" "immich"
    "Kavita" "memos" "paperless-ngx" "portainer" "seafile"
    "searxng" "stirling-pdf"
)

# Base directory where the services are located
BASE_DIR=~/Apps

echo "Stopping all services..."
for SERVICE in "${SERVICES[@]}"; do
    echo "Stopping $SERVICE..."
    cd "$BASE_DIR/$SERVICE" || { echo "Failed to access $SERVICE"; continue; }
    docker compose down
done

echo "All services have been stopped."
