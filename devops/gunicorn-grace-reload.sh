#!/bin/sh
# ToDo: fix this script
kill -HUP `ps -C gunicorn fch -o pid | head -n`