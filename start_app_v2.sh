#!/bin/bash

# LIMS-X: Start Docker environment and initialize database

# Exit on any error
set -e

echo "Stopping any existing containers..."
docker compose down

echo "Rebuilding Docker images..."
docker compose build --no-cache

echo "Starting containers..."
docker compose up -d

echo "Waiting for MySQL container to become healthy..."
# Wait until MySQL is healthy
until docker compose exec db mysqladmin ping -h db -uroot -proot --silent; do
    echo "Waiting for MySQL..."
    sleep 2
done

echo "Loading database dump..."
docker compose exec web sh -c "mysql -h db -u root -proot limsdb < /app/limsdb_dump.sql"

echo "Running Django migrations..."
docker compose exec web python

