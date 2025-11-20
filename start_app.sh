#!/bin/bash

# Activate virtual environment
source venv_sys/bin/activate

# Kill any process using Django's default port (8000)
PORT=8000
if lsof -i :$PORT > /dev/null
then
    echo "Port $PORT is in use. Killing the process..."
    PID=$(lsof -t -i :$PORT)
    kill -9 $PID
    echo "Killed process $PID on port $PORT"
fi

# Start Celery worker in background (logs to celery.log)
celery -A lab_data_manager worker --loglevel=info >> celery.log 2>&1 &

# Start Django development server
python manage.py runserver $PORT
