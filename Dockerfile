FROM alpine:latest

# TARGETARCH will be amd64 or arm64
ARG TARGETARCH

RUN \
  # install packages
  apk --no-cache add \
    mysql-client \
    postgresql-client

ADD init_cron.sh /usr/local/bin/
ADD dump.sh /usr/local/bin/

# hours between backups(maximum 24 hours) - every 24 hours by default
ENV DUMP_EVERY_X_HOURS="24"
ENV MYSQL_DUMP_FILE="/dumps/mysql.sql"
ENV POSTGRES_DUMP_FILE="/dumps/postgres.sql"

# mysql env vars
ENV MYSQL_DATABASE=""
ENV MYSQL_HOST=""
ENV MYSQL_PASSWORD=""
ENV MYSQL_USER=""

# postgres env vars
ENV POSTGRES_DATABASE=""
ENV POSTGRES_HOST=""
ENV POSTGRES_PASSWORD=""
ENV POSTGRES_USER=""

# create the cron job and start the cron daemon
ENTRYPOINT /usr/local/bin/init_cron.sh && /usr/sbin/crond -f
