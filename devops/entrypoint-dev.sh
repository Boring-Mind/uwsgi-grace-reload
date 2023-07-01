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

# Run Gunicorn server
# Preload argument will not work here. Since Django will retrieve secrets on it's
# initialization. Django will not be re-initialized after Gunicorn restart if
# --preload argument will be provided.
gunicorn gunicorn_reload.wsgi:application --bind 0.0.0.0:80 --workers=4 --timeout=120 --limit-request-line=0 -p /opt/gunicorn_master.pid;

# Evaluating passed command:
#exec "$@"