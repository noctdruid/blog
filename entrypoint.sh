#!/bin/sh

echo "Waiting for postgres..."

while ! nc -z $DB_HOST $DB_PORT; do
    sleep 0.1
done

echo "PostgreSQL started"

echo "Running migrations..."
python3 manage.py migrate --no-input

echo "Collecting static files..."
python3 manage.py collectstatic --no-input

exec "$@"
