#!/bin/bash

# 4. Application Health Checker: 
# Please write a script that can check the uptime of an application and determine if it is functioning correctly or not. The script must accurately assess the application's status by checking HTTP status codes. It should be able to detect if the application is 'up', meaning it is functioning correctly, or 'down', indicating that it is unavailable or not responding.

for url in "$@"; do
    status=$(curl -s -o /dev/null -w "%{http_code}" "$url")
    if [ "$status" -ge 200 ] && [ "$status" -lt 400 ]; then
        echo "$url is UP ($status)"
    else
        echo "$url is DOWN ($status)"
    fi
done
