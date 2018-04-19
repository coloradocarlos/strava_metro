#!/bin/bash

#
# Counter Name, Counter Data, Timeframe Needed from Strava, Edge ID
# 26th Street ZELT, all 2017, all 2017 by month, 22223
#

psql -U $RUSER -h $RHOST -d strava_metro -c "\COPY (SELECT id, osm_id, osm_name, rollup_date, tactcnt, tactcnt_0, tactcnt_1, tactcnt_2, tactcnt_3, tactcnt_4, tactcnt_5, tactcnt_6, tactcnt_7 FROM cos_osm_edges_rollup_weekday WHERE id=22223 ORDER BY rollup_date) TO '26th_st_zelt.csv' WITH CSV HEADER;"
