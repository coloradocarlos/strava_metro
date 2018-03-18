--
-- SQL to set the indexes on the full Edges, Nodes, and OD datasets
--

-- Load the data BEFORE running this SQL script

-- Edges
ALTER TABLE colorado_osm_edges_metro_edges_data ADD COLUMN datetime timestamp without time zone;

-- From julian date to timestamp (do for both 2016 and 2017)
UPDATE colorado_osm_edges_metro_edges_data set datetime = cast(timestamp '2015-12-31' + interval '1 day' * day  + interval '1 hour' * hour + interval '1 minute' * minute  as timestamp) where year = 2016;
UPDATE colorado_osm_edges_metro_edges_data set datetime = cast(timestamp '2016-12-31' + interval '1 day' * day  + interval '1 hour' * hour + interval '1 minute' * minute  as timestamp) where year = 2017;

CREATE INDEX colorado_osm_edges_metro_edges_data_datetime_idx ON colorado_osm_edges_metro_edges_data USING btree (datetime);
CREATE INDEX colorado_osm_edges_metro_edges_data_id_idx ON colorado_osm_edges_metro_edges_data USING btree (edge_id);
CREATE INDEX colorado_osm_edges_metro_edges_data_hour_idx ON colorado_osm_edges_metro_edges_data USING btree (hour);

-- Nodes
ALTER TABLE colorado_osm_edges_metro_nodes_data ADD COLUMN datetime timestamp without time zone;

-- From julian date to timestamp (do for both 2016 and 2017)
UPDATE colorado_osm_edges_metro_nodes_data set datetime = cast(timestamp '2015-12-31' + interval '1 day' * day  + interval '1 hour' * hour + interval '1 minute' * minute  as timestamp) where year = 2016;
UPDATE colorado_osm_edges_metro_nodes_data set datetime = cast(timestamp '2016-12-31' + interval '1 day' * day  + interval '1 hour' * hour + interval '1 minute' * minute  as timestamp) where year = 2017;

CREATE INDEX colorado_osm_edges_metro_nodes_data_datetime_idx ON colorado_osm_edges_metro_nodes_data USING btree (datetime);
CREATE INDEX colorado_osm_edges_metro_nodes_data_id_idx ON colorado_osm_edges_metro_nodes_data USING btree (node_id);
CREATE INDEX colorado_osm_edges_metro_nodes_data_hour_idx ON colorado_osm_edges_metro_nodes_data USING btree (hour);

-- OD
ALTER TABLE colorado_osm_edges_metro_od_data ADD COLUMN datetime timestamp without time zone;

-- From julian date to timestamp (do for both 2016 and 2017)
UPDATE colorado_osm_edges_metro_od_data set datetime = cast(timestamp '2015-12-31' + interval '1 day' * day  + interval '1 hour' * hour + interval '1 minute' * minute  as timestamp) where year = 2016;
UPDATE colorado_osm_edges_metro_od_data set datetime = cast(timestamp '2016-12-31' + interval '1 day' * day  + interval '1 hour' * hour + interval '1 minute' * minute  as timestamp) where year = 2017;

CREATE INDEX colorado_osm_edges_metro_od_data_datetime_idx ON colorado_osm_edges_metro_od_data USING btree (datetime);
CREATE INDEX colorado_osm_edges_metro_od_data_id_idx ON colorado_osm_edges_metro_od_data USING btree (polygon_id);
CREATE INDEX colorado_osm_edges_metro_od_data_hour_idx ON colorado_osm_edges_metro_od_data USING btree (hour);
