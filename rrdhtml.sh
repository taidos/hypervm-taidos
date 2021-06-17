#!/bin/sh
# Script Name:  vz_direct_traffic_render
# Author:       "Denis Titov, ISP Okeanika" <denis@okeanika.net.ua>
# Website:      http://www.okeanika.net.ua

rrd_path=/var/lib/rrd
www_path=/var/www/html/traf

# Clear out the old index, otherwise you end up with a repeating index. This would also be a good place to put a header.
rm ${www_path}/index.html

cd $rrd_path
for RRD in *.rrd
do
        CTID=$(echo $RRD | sed 's/.rrd$//')

        # list of intervals, 1d = last day, 1w = last week and so on
        for INT in 1h 1d 1w 1m 1y
        do
                /usr/bin/rrdtool graph ${www_path}/${CTID}-${INT}.png \
                        --start now-$INT --end now \
                        -w 1000 -h 500 \
                        --title "CTID $CTID - Interval $INT" \
                        DEF:in=$RRD:IN:AVERAGE AREA:in#aea:'IN' LINE1:in#0e0 \
                        DEF:out=$RRD:OUT:AVERAGE AREA:out#eaa:'OUT' LINE1:out#e00
                echo "<p><img src=\"${CTID}-${INT}.png\"><br/><br/></p>" >> ${www_path}/index.html
        done
done
