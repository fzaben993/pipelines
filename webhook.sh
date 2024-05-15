#!/bin/bash
curl -X POST -H 'Content-type: application/json' --data "$1" "https://hooks.slack.com/services/$WEBHOOK_SECRET"  