#!/bin/bash

echo -e "${PASSWORD}\n${PASSWORD}" | passwd timemachine
/etc/init.d/netatalk start
tail -f /var/log/afpd.log
