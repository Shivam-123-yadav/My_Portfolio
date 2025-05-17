#!/bin/bash

# Exit on error
set -o errexit

# Install dependencies
pip install -r requirements.txt

# Make migrations and migrate
python manage.py makemigrations
python manage.py migrate

# Collect static files
python manage.py collectstatic --noinput

# Optionally create superuser if environment variable is set
if [ "$CREATE_SUPERUSER" = "true" ]; then
    python manage.py createsuperuser --no-input --email "$DJANGO_SUPERUSER_EMAIL"
fi
