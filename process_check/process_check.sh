#!/bin/bash

# ==========================================
# config
# ==========================================
TARGET_SERVICES=("nginx" "crond" "sshd")

# ==========================================
# main
# ==========================================
echo "=========================================="
echo "Starting process check..."
echo "=========================================="

for SERVICE in "${TARGET_SERVICES[@]}"; do
    echo "========= $SERVICE ========="
    process_count=$(ps aux | grep "$SERVICE" | grep -v grep | wc -l)
    echo "$SERVICE process $process_count"

    if [[ $process_count -eq 0 ]]; then
        echo "not running $SERVICE"
        sudo service "$SERVICE" start
        echo "Waiting 60 seconds for startup..."
        sleep 60
        current_count=$(ps aux | grep "$SERVICE" | grep -v grep | wc -l)
        
        if [[ $current_count -gt 0 ]]; then
            echo "$SERVICE is running (Restarted successfully)"
        else
            echo "[ERROR] Failed to start $SERVICE"
        fi
    else
        echo "[OK]$SERVICE is running"
    fi
done

echo "=========================================="
echo "All services checked."
echo "=========================================="
