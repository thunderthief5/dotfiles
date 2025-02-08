#!/bin/bash
#
# start_services.sh
#
# Description:
#   This script automates the process of starting multiple Docker services.
#   It navigates to predefined service directories and runs `docker compose up -d`
#   to launch the containers in detached mode.
#
# Usage:
#   Run this script from the terminal: ./start_services.sh
#   Or set it as a cron job to run automatically at 01:10 AM every day right after the duplicati backup
#
# Cron Job Setup:
#   1. Open crontab: crontab -e
#   2. Add the following line:
#      10 1 * * * /bin/bash /home/thunderthief/.bin/start_services.sh >> /home/thunderthief/Apps/service_logs.txt 2>&1
#   3. Save and exit.
#
# Requirements:
#   - Docker and Docker Compose must be installed on the system.
#   - The specified services must be set up in the defined directories.
#
# Author: [ThunderThief]
# Date: [05-Feb-25]

# Define the service directories

SERVICES=(
    "audiobookshelf"
    "code-server"
    "dash"
    "dozzle"
    "forgejo"
    "hoarder"
    "homarr"
    "immich"
    "it-tools"
    "Kavita"
    "memos"
    "paperless-ngx"
    "portainer"
    "seafile"
    "searxng"
    "speedtest-tracker"
    "stirling-pdf"
)

# Base directory where the services are located
BASE_DIR=~/Apps

echo "Starting all services..."
for SERVICE in "${SERVICES[@]}"; do
    echo "Starting $SERVICE..."
    cd "$BASE_DIR/$SERVICE" || { echo "Failed to access $SERVICE"; continue; }
    docker compose up -d
done

echo "All services have been started."
