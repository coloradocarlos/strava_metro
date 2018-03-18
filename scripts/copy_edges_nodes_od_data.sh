#!/bin/bash
#
# Copies the Edges, Nodes, and OD full dataset
#
STRAVA_ROOT=/mnt/strava_metro/co_201701_201712_ride
pushd $STRAVA_ROOT/Edges
psql -U $RUSER -h $RHOST -d strava_metro -c "\COPY colorado_osm_edges_metro_edges_data FROM 'edges_data.csv' DELIMITERS ',' CSV HEADER;"
popd
pushd $STRAVA_ROOT/Nodes
psql -U $RUSER -h $RHOST -d strava_metro -c "\COPY colorado_osm_edges_metro_nodes_data FROM 'nodes_data.csv' DELIMITERS ',' CSV HEADER;"
popd
pushd $STRAVA_ROOT/OD
psql -U $RUSER -h $RHOST -d strava_metro -c "\COPY colorado_osm_edges_metro_od_data FROM 'od_data.csv' DELIMITERS ',' CSV HEADER;"
popd
