#!/bin/bash

#
# Counter Name, Counter Data, Timeframe Needed from Strava, Edge ID
# 26th Street ZELT, all 2017, all 2017 by month, 22223
#

WEEK=weekday

EDGE_ID=22223
CSV_FILE=26th_st_zelt

# EDGE_ID=407672
# CSV_FILE=rock_island_trail_1

# EDGE_ID=484465
# CSV_FILE=rock_island_trail_2

# EDGE_ID=361108
# CSV_FILE=templeton_gap

# EDGE_ID=16892
# CSV_FILE=tejon_st

# EDGE_ID=821836
# CSV_FILE=midland_trail

if [ ! -d 'csv' ]; then mkdir 'csv'; fi
psql -U $RUSER -h $RHOST -d strava_metro -c "\COPY (SELECT id, osm_id, osm_name, rollup_date, tactcnt, tactcnt_0, tactcnt_1, tactcnt_2, tactcnt_3, tactcnt_4, tactcnt_5, tactcnt_6, tactcnt_7 FROM cos_osm_edges_rollup_$WEEK WHERE id=$EDGE_ID ORDER BY rollup_date) TO './csv/$CSV_FILE.$WEEK.csv' WITH CSV HEADER;"
