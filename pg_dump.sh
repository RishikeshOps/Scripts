#!/bin/bash
$TODAY=`date --iso-8601` 
$BACKDIR=/backup 

pg_dump [options] > $BACKDIR/$HOSTNAME-$TODAY

if [ "$?"-ne 0]; then echo "Help" | mail -s "Backup failed" you@example.com; exit 1; fi
