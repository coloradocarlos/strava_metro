--
-- Create COS specific tables by copying data from Colorado tables to improve join performance
--
-- Colorado Springs bounding box. See http://arthur-e.github.io/Wicket/sandbox-gmaps3.html
\set cos_geom '\'SRID=4326;POLYGON((-104.94827270507812 39.0737775145086,-104.65988159179688 39.0737775145086,-104.65988159179688 38.716255439263264,-104.94827270507812 38.716255439263264,-104.94827270507812 39.0737775145086))\''

--
-- OSM Edges
--
SELECT count(*) AS colorado_edges_count FROM colorado_osm_edges;
SELECT count(*) AS cos_edges_count FROM colorado_osm_edges WHERE ST_Within(geom, ST_GeomFromEWKT(:cos_geom));
DROP TABLE IF EXISTS cos_osm_edges;
SELECT * INTO cos_osm_edges FROM colorado_osm_edges WHERE ST_Within(geom, ST_GeomFromEWKT(:cos_geom));
-- Duplicate indexes on cos_osm_edges like on colorado_osm_edges
ALTER TABLE ONLY cos_osm_edges ADD CONSTRAINT pkey_coso_edges_2po_4pgr PRIMARY KEY (id);
CREATE INDEX cos_gist ON cos_osm_edges USING gist (geom);
CREATE INDEX idx_cos_edges_2po_4pgr_source ON cos_osm_edges USING btree (source);
CREATE INDEX idx_cos_edges_2po_4pgr_target ON cos_osm_edges USING btree (target);
SELECT count(*) AS cos_edges_count_new FROM cos_osm_edges;

--- OSM Nodes
SELECT count(*) AS colorado_nodes_count FROM colorado_osm_edges_nodes;
SELECT count(*) AS cos_nodes_count FROM colorado_osm_edges_nodes WHERE ST_Within(the_geom, ST_GeomFromEWKT(:cos_geom));
DROP TABLE IF EXISTS cos_osm_edges_nodes;
SELECT * INTO cos_osm_edges_nodes FROM colorado_osm_edges_nodes WHERE ST_Within(the_geom, ST_GeomFromEWKT(:cos_geom));
-- Duplicate indexes on cos_osm_edges_nodes like on colorado_osm_edges_nodes
ALTER TABLE cos_osm_edges_nodes ADD CONSTRAINT pkey_cos_osm_edges_nodes PRIMARY KEY (id);
CREATE INDEX cos_osm_edges_nodes_geom_idx ON cos_osm_edges_nodes USING gist (the_geom);
SELECT count(*) AS cos_nodes_count_new FROM cos_osm_edges_nodes;

-- OD Hex
SELECT count(*) AS colorado_od_count FROM colorado_edges_od_polygons_hex;
SELECT count(*) AS cos_od_count FROM colorado_edges_od_polygons_hex WHERE ST_Within(geom, ST_GeomFromEWKT(:cos_geom));
DROP TABLE IF EXISTS cos_edges_od_polygons_hex;
SELECT * INTO cos_edges_od_polygons_hex FROM colorado_edges_od_polygons_hex WHERE ST_Within(geom, ST_GeomFromEWKT(:cos_geom));
-- Duplicate indexes on cos_edges_od_polygons_hex like on colorado_edges_od_polygons_hex
ALTER TABLE ONLY cos_edges_od_polygons_hex ADD CONSTRAINT cos_edges_od_polygons_hex_pkey PRIMARY KEY (id);
CREATE INDEX cos_edges_od_polygons_hex_geom_idx ON cos_edges_od_polygons_hex USING gist (geom);
SELECT count(*) AS cos_od_count_new FROM cos_edges_od_polygons_hex;
