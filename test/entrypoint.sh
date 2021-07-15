#!/bin/sh
set -e

echo "Wait for grafana to load"
sleep 5

echo "Test data source created"

curl -s http://admin:grafana@grafana:3000/api/datasources | jq .
curl -s http://admin:grafana@grafana:3000/api/datasources | jq -r '.[0].url' | grep "http://prometheus:9090"

echo "Wait for scraping"
sleep 16

echo "Test scraped"

curl -s -g 'http://prometheus:9090/api/v1/series?' --data-urlencode 'match[]=probe_duration_seconds{instance="https://www.sadibey.com"}' | jq .
curl -s -g 'http://prometheus:9090/api/v1/series?' --data-urlencode 'match[]=probe_duration_seconds{instance="https://www.sadibey.com"}' | jq -r '.data[0].job' | grep 'blackbox-http'