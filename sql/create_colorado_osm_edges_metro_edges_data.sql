#
# SQL to create the full Edges, Nodes, and OD tables ready for loading
#

# Edges
# CSV sample:
# 549402,2017,31,17,6,0,1,0,1,1,,10.1129983222041,1
# edge_id,year,day,hour,minute,athlete_count,rev_athlete_count,activity_count,rev_activity_count,total_activity_count,activity_time,rev_activity_time,commute_count
DROP TABLE IF EXISTS colorado_osm_edges_metro_edges_data;
CREATE TABLE colorado_osm_edges_metro_edges_data (edge_id integer, year integer, day integer, hour integer, minute integer, athlete_count integer, rev_athlete_count integer, activity_count integer, rev_activity_count integer, total_activity_count integer, activity_time numeric, rev_activity_time numeric, commute_count integer) WITH (OIDS=FALSE);

# Nodes
DROP TABLE IF EXISTS colorado_osm_edges_metro_nodes_data;
CREATE TABLE colorado_osm_edges_metro_nodes_data ( node_id integer, year integer, day integer, hour integer, minute integer, athletes integer, activities integer, median_wait integer, max_wait integer, min_wait integer, commute_count integer) WITH (OIDS=FALSE);

# OD
DROP TABLE IF EXISTS colorado_osm_edges_metro_od_data;
CREATE TABLE colorado_osm_edges_metro_od_data (polygon_id integer, year integer, day integer, hour integer, minute integer, commute integer, dest_polygon_id integer, intersected_polygons integer[]) WITH (OIDS=FALSE);

# Then copy data BEFORE creating indexes:
# See also copy_data.sh
# psql -U cperez -h strava-metro-db1.cjgeimtqkdes.us-west-2.rds.amazonaws.com -d strava_metro -c "\COPY colorado_osm_edges_metro_edges_data FROM 'colorado_osm_edges_metro_edges_data.csv' DELIMITERS ',' CSV HEADER;"
