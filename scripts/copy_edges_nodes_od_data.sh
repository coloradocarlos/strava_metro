#!/bin/bash
#
# Copies the Edges, Nodes, and OD full datasets
#
STRAVA_ROOT=/mnt/strava_metro/co_201701_201712_ride
pushd $STRAVA_ROOT/Edges
psql -U cperez -h strava-metro-db1.cjgeimtqkdes.us-west-2.rds.amazonaws.com -d strava_metro -c "\COPY colorado_osm_edges_metro_edges_data FROM 'edges_data.csv' DELIMITERS ',' CSV HEADER;"
popd
pushd $STRAVA_ROOT/Nodes
psql -U cperez -h strava-metro-db1.cjgeimtqkdes.us-west-2.rds.amazonaws.com -d strava_metro -c "\COPY nodes_data FROM 'colorado_osm_edges_metro_nodes_data.csv' DELIMITERS ',' CSV HEADER;"
popd
pushd $STRAVA_ROOT/OD
psql -U cperez -h strava-metro-db1.cjgeimtqkdes.us-west-2.rds.amazonaws.com -d strava_metro -c "\COPY od_data FROM 'colorado_osm_edges_metro_od_data.csv' DELIMITERS ',' CSV HEADER;"
popd
