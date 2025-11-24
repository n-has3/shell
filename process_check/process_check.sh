#!/bin/bash
# ==========================================
# Configuration
# ==========================================
TARGET_SERVICES=(
  "service1"
  "service2"
  "service3"
)
START_WAIT_TIME=60

# ==========================================
# Main Logic
# ==========================================
echo "=========================================="
echo "Starting process check..."
echo "Start : $(date '+%Y-%m-%d %H:%M:%S')"
echo "=========================================="

for SERVICE in "${TARGET_SERVICES[@]}"; do
    echo "========= $SERVICE ========="
    process_count=$(pgrep -f "$SERVICE" | wc -l)
    
    echo "$SERVICE process count: $process_count"

    if [[ $process_count -eq 0 ]]; then
        echo "[WARN] $SERVICE is not running. Attempting to start..."
        
        sudo service "$SERVICE" start
        echo "Waiting ${START_WAIT_TIME} seconds for startup..."
        sleep "$START_WAIT_TIME"
        
        current_count=$(pgrep -f "$SERVICE" | wc -l)
        
        if [[ $current_count -gt 0 ]]; then
            echo "[OK] $SERVICE is running (Restarted successfully)"
            echo "process count: $current_count"
        else
            echo "[ERROR] Failed to start $SERVICE"
            echo "process count: $current_count"
        fi
    else
        echo "[OK] $SERVICE is running"
        echo "process count: $process_count"
    fi
done

echo "=========================================="
echo "All services checked."
echo "End : $(date '+%Y-%m-%d %H:%M:%S')"
echo "=========================================="