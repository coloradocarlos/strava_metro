--
-- Add index to osm_edges/nodes/od
--

-- Edges
-- Constraints and index added in Strava Metro provided SQL

-- Nodes
ALTER TABLE colorado_osm_edges_nodes ADD CONSTRAINT pkey_colorado_osm_edges_nodes PRIMARY KEY (id);
CREATE INDEX colorado_osm_edges_nodes_geom_idx ON colorado_osm_edges_nodes USING gist (the_geom);

-- OD
-- Constraints and index added in Strava Metro provided SQL
