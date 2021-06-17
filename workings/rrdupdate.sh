#!/bin/sh
# Script Name:  vz_direct_traffic_log
# Author:       "Brian Harrington, Alticon Inc" <bharrington@alticon.net>
# Website:      htty://www.alticon.net
# Editor:       "Denis Titov, ISP Okeanika" <denis@okeanika.net.ua>

# Time to do the data collection.
for veid in $(/usr/sbin/vzlist -o veid -H)
do
        RRDFILE="/var/lib/rrd/$veid.rrd"
        if ! test -e $RRDFILE; then
                echo $RRDFILE does not exist, creating.

                # Place your preferred RRD Creation command here
                # or use this one, following command will create new RRD file with 300 sec step (for 5 min cron)
                /usr/bin/rrdtool create $RRDFILE --step 300 \
                        DS:IN:COUNTER:1000:0:U \
                        DS:OUT:COUNTER:1000:0:U \
                        RRA:AVERAGE:0.5:1:600000 \
                        RRA:AVERAGE:0.5:100:60000 \
                        RRA:AVERAGE:0.5:1000:6000
        fi
        # Parse out the inbound/outbound traffic and assign them to the corresponding variables
        eval `/usr/sbin/vzctl exec $veid "grep venet0 /proc/net/dev"  |  \
                awk -F: '{print $2}' | awk '{printf"CTIN=%s\nCTOUT=%s\n", $1, $9}'`

        # Send the data to the corresponding RRD time with (N)now as the update time
        /usr/bin/rrdtool update $RRDFILE N:$CTIN:$CTOUT
done
