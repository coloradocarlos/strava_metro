# RDS PostGIS Cheat Sheet

How to setup and load PostGIS on AWS Relational Database Service (RDS) instance to hold the Strava Metro data.

Carlos Perez (perez@doorstep.com)

## Install EC2 instance

The EC2 instance will be used to extract and copy data to the RDS instance. As of this writing, a t2.micro
instance is sufficient. The Strava files are processed on an Elastic Block Store volume that is 250 GB.

The EC2 instance is a stock AMI'Canonical, Ubuntu, 16.04 LTS, amd64 xenial image build on 2017-10-26'.

## Setup PostGIS

Instructions can be found here: [AWS PostgreSQL with PostGIS extensions](http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Appendix.PostgreSQL.CommonDBATasks.html#Appendix.PostgreSQL.CommonDBATasks.PostGIS).

The Security groups rules need to be setup to allow access to the RDS instance to port 5432.

The database is a PostgreSQL 9.6.6 on a db.t2.medium instance on a 250 GB SSD storage device.

## Basics

Database name: strava_metro

```bash
$ psql -U $RUSER -h $RHOST -d strava_metro
```

Where `$RUSER` is the PostgreSQL username and `$RHOST` is the AWS assigned name found in the AWS console.

`$STRAVA_ROOT` set to the location of the files, example, `/mnt/strava_metro/co_201701_201712`

## Load Data

1) Extract compressed tarball from Strava Metro

The data feed first needst to be fetched using the instructions provided by Strava Metro. For safe keeping, the
file should be copied to an S3 bucket and not kept on the volume permanentaly.

2) Load Edges OSM data

```bash
$ cd $STRAVA_ROOT/Edges
$ gunzip colorado_osm_edges.sql.gz
$ sed "s/postgres/$RUSER/g" colorado_osm_edges.sql > colorado_osm_edges.fixed.sql
$ psql -U $RUSER -h $RHOST -d strava_metro -c "DROP TABLE colorado_osm_edges;"
$ psql -U $RUSER -h $RHOST -d strava_metro -f colorado_osm_edges.fixed.sql
```

2) Load Nodes OSM data

```bash
$ cd $STRAVA_ROOT/Nodes
$ gunzip colorado_osm_edges_nodes.sql.gz
$ sed "s/postgres/$RUSER/g" colorado_osm_edges_nodes.sql > colorado_osm_edges_nodes.fixed.sql
$ psql -U $RUSER -h $RHOST -d strava_metro -c "DROP TABLE colorado_osm_edges_nodes;"
$ psql -U $RUSER -h $RHOST -d strava_metro -f colorado_osm_edges.fixed.sql
```

3) Load OD OSM data

```bash
$ cd $STRAVA_ROOT/Nodes
$ gunzip colorado_edges_od_polygons_hex.sql.gz
$ sed "s/postgres/$RUSER/g" colorado_edges_od_polygons_hex.sql > colorado_edges_od_polygons_hex.fixed.sql
$ psql -U $RUSER -h $RHOST -d strava_metro -c "DROP TABLE colorado_edges_od_polygons_hex;"
$ psql -U $RUSER -h $RHOST -d strava_metro -f colorado_edges_od_polygons_hex.fixed.sql
```

4) Build indexes on OSM tables

```bash
$ cd ~/strava_metro/sql
$ psql -U $RUSER -h $RHOST -d strava_metro -f indexes_colorado_osm_tables.sql
```

5) Load CSV files to load full data Edges/Nodes/OD tables

Note: the update timestamp column and indexes in the last step take a while to build.

```bash
$ cd ~/strava_metro/sql
$ psql -U $RUSER -h $RHOST -d strava_metro -f create_colorado_osm_edges_metro_edges_data.sql
$ cd ~/strava_metro/scripts
$ ./copy_edges_nodes_od_data.sh
$ cd ~/strava_metro/sql
$ psql -U $RUSER -h $RHOST -d strava_metro -f indexes_colorado_osm_edges_metro_edges_data.sql
```

6) Edges: generate and load rollup data

```bash
$ cd $STRAVA_ROOT/Edges
$ ~/strava_metro/scripts/gen_edges_sql.sh > edges_rollup.sql
$ psql -U $RUSER -h $RHOST -d strava_metro -f edges_rollup.sql
```

7) Nodes: generate and load rollup files

```bash
$ cd $STRAVA_ROOT/Nodes
$ ~/strava_metro/scripts/gen_nodes_sql.sh > nodes_rollup.sql
$ psql -U $RUSER -h $RHOST -d strava_metro -f nodes_rollup.sql
```

8) OD: generate and load rollup files

```bash
$ cd $STRAVA_ROOT/OD
$ ~/strava_metro/scripts/gen_od_sql.sh > od_rollup.sql
$ psql -U $RUSER -h $RHOST -d strava_metro -f od_rollup.sql
```

9) Create Colorado Springs specific OSM tables

## Usage

TBD
