#!/bin/sh

set -e

# activate our virtual environment

. "$VENV_PATH"/bin/activate

# Apply all migrations
python3 manage.py migrate;

# Collect staticfiles
python3 manage.py collectstatic --noinput;

# Create superuser
#python3 manage.py initadmin;

# Run server
gunicorn gunicorn_reload.wsgi:application --bind 0.0.0.0:80 --workers=4 --timeout=120 --limit-request-line=0 --preload;

# Evaluating passed command:
#exec "$@"