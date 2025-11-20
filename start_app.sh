#!/bin/bash

# LIMS-X: Robust Docker start script
# Stops old containers, rebuilds images, waits for MySQL, starts web, loads DB, and runs migrations.

set -e  # Exit on any error

echo "Stopping any existing containers..."
docker compose down

echo "Rebuilding Docker images..."
docker compose build --no-cache

echo "Starting MySQL container..."
docker compose up -d db

echo "Waiting for MySQL to be fully ready..."
until docker compose exec db mysqladmin ping -h db -uroot -proot --silent; do
    echo "Waiting for MySQL..."
    sleep 2
done
echo "MySQL is ready!"

echo "Starting web container..."
docker compose up -d web

# Give web container a few seconds to initialize
sleep 5

echo "Loading database dump..."
docker compose exec web sh -c "mysql -h db -u root -proot limsdb < /app/limsdb_dump.sql"

echo "Running Django migrations..."
docker compose exec web python manage.py migrate

echo "Collecting static files..."
docker compose exec web python manage.py collectstatic --noinput

echo "LIMS-X is up and running!"
echo "Access the app at: http://127.0.0.1:8000"
