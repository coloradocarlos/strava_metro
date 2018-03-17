--
-- Add index to osm_edges/nodes/od
--

-- Edges
ALTER TABLE colorado_osm_edges ADD CONSTRAINT pkey_colorado_osm_edges PRIMARY KEY (id);
CREATE INDEX colorado_osm_edges_geom_idx ON colorado_osm_edges USING gist (the_geom);

-- Nodes
ALTER TABLE colorado_osm_edges_nodes ADD CONSTRAINT pkey_colorado_osm_edges_nodes PRIMARY KEY (id);
CREATE INDEX colorado_osm_edges_nodes_geom_idx ON colorado_osm_edges_nodes USING gist (the_geom);

-- OD
ALTER TABLE colorado_edges_od_polygons_hex ADD CONSTRAINT pkey_colorado_edges_od_polygons_hex PRIMARY KEY (id);
CREATE INDEX colorado_edges_od_polygons_hex_geom_idx ON colorado_edges_od_polygons_hex USING gist (geom);
