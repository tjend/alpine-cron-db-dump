#!/bin/sh
# environment variables:
#   - MYSQL_DUMP_FILE is the file to save the mysql dump to
#   - POSTGRES_DUMP_FILE is the file to save the postgres dump to
#
# mysql environment variables:
#   - MYSQL_DATABASE
#   - MYSQL_HOST
#   - MYSQL_PASSWORD
#   - MYSQL_USER
#
# postgres environment variables:
#   - POSTGRES_DATABASE
#   - POSTGRES_HOST
#   - POSTGRES_PASSWORD
#   - POSTGRES_USER

# run mysql dump
export MYSQL_PWD="${MYSQL_PASSWORD}"
if [ ! -z ${MYSQL_HOST} ]; then
  mysqldump "${MYSQL_DATABASE}" -h "${MYSQL_HOST}" -u "${MYSQL_USER}" > "${MYSQL_DUMP_FILE}"
fi

# run postgres dump
export PGDATABASE="${POSTGRES_DATABASE}"
export PGHOST="${POSTGRES_HOST}"
export PGPASSWORD="${POSTGRES_PASSWORD}"
export PGUSER="${POSTGRES_USER}"
if [ ! -z ${PGHOST} ]; then
  pg_dump > "${POSTGRES_DUMP_FILE}"
fi
