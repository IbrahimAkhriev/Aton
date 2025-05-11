#!/bin/bash

# Загрузка .env, если есть
if [ -f ".env" ]; then
  export $(grep -v '^#' .env | xargs)
fi

USAGE=$(df / | grep / | awk '{print $5}' | sed 's/%//')

if [ "$USAGE" -ge 85 ]; then
    echo "Disk usage is at ${USAGE}%" > /tmp/disk_alert.txt

    sendemail -f "$FROM_EMAIL" \
              -t "$TO_EMAIL" \
              -u "⚠️ Alert: High Disk Usage ($USAGE%)" \
              -m "Disk usage on $(hostname) is at ${USAGE}%. Please check immediately." \
              -s "$SMTP_SERVER:$SMTP_PORT" \
              -xu "$SMTP_USER" \
              -xp "$SMTP_PASS" \
              -o tls=yes
fi

