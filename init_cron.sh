#!/bin/sh
# create cronjob entry to run dump script

# run the dump script every ${DUMP_EVERY_X_HOURS} hours at 3 minutes past the hour
echo "3 */${DUMP_EVERY_X_HOURS} * * * /usr/local/bin/dump.sh" > /var/spool/cron/crontabs/root
