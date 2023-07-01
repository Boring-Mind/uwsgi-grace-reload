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

# Run uWSGI server
uwsgi --ini uwsgi_conf.ini;

# Evaluating passed command:
#exec "$@"