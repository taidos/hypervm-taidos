#!/bin/sh
# Script Name:  vz_direct_traffic_log
# Author:       "Brian Harrington, Alticon Inc" <bharrington@alticon.net>
# Website:      htty://www.alticon.net
# Editor:       "Denis Titov, ISP Okeanika" <denis@okeanika.net.ua>
#TOT="1000"
#TOT="sum=$(( $CTIN + $CTOUT ))"
#echo $TOT;
#IP=$(vzlist -H -o ctid,ip | grep $veid | awk '{ print $2}')
# Time to do the data collection.
for veid in $(/usr/sbin/vzlist -o veid -H)
do
        RRDFILE="/usr/local/lxlabs/hypervm/data/traffic/openvz-$veid.rrd"
        if ! test -e $RRDFILE; then
                echo $RRDFILE does not exist, creating.

                # Place your preferred RRD Creation command here
                # or use this one, following command will create new RRD file with 300 sec step (for 5 min cron)
                /usr/bin/rrdtool create $RRDFILE --step 300 \
                        DS:total:ABSOLUTE:800:-1125000000:1125000000 \
                        DS:incoming:ABSOLUTE:800:-1125000000:1125000000 \
                        DS:outgoing:ABSOLUTE:800:-1125000000:1125000000 \
                        RRA:AVERAGE:0.5:1:600 \
                        RRA:AVERAGE:0.5:6:700 \
                        RRA:AVERAGE:0.5:24:775 \
#                       N:$CTIN:$CTOUT \
                        RRA:AVERAGE:0.5:288:797
        fi
        # Parse out the inbound/outbound traffic and assign them to the corresponding variables
        #eval `/usr/sbin/vzctl exec $veid "grep venet0 /proc/net/dev"  |  \
        #        awk -F: '{print $2}' | awk '{printf"CTIN=%s\nCTOUT=%s\n", $1, $9}'`
        iptables -nxv -L FORWARD | grep $(vzlist -H -o ctid,ip | grep $veid | awk '{ print $2}')| awk '{printf"CTIN=%s\nCTOUT=%s\n", $2, $2}' | sed '2d' | sed '2d'

        # Send the data to the corresponding RRD time with (N)now as the update time
        /usr/bin/rrdtool update $RRDFILE N:$(( $CTIN + $CTOUT )):$CTIN:$CTOUT;
#       iptables -Z

done
