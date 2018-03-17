#!/bin/bash
#
# Generates SQL import script for Nodes CSV files
#
ST="co"
ID="co_201701_201709_"
echo "/* Generated on `date` */"
for file in $ID*.csv ; do
    [ -e "$file" ] || continue
    TBL=`echo "$ST_$file" | sed -e "s/$ID//" -e 's/.csv//'`
    DROP_TBL="DROP TABLE IF EXISTS $TBL;"
    echo $DROP_TBL
    CREATE_TBL="CREATE TABLE $TBL (node_id integer, athcnt_0 integer, actcnt_0 integer, cmtcnt_0 integer, pct_0_0 numeric, pct_025_0 numeric, pct_05_0 numeric, pct_075_0 numeric, pct_1_0 numeric, athcnt_1 integer, actcnt_1 integer, cmtcnt_1 integer, pct_0_1 numeric, pct_025_1 numeric, pct_05_1 numeric, pct_075_1 numeric, pct_1_1 numeric, athcnt_2 integer, actcnt_2 integer, cmtcnt_2 integer, pct_0_2 numeric, pct_025_2 numeric, pct_05_2 numeric, pct_075_2 numeric, pct_1_2 numeric, athcnt_3 integer, actcnt_3 integer, cmtcnt_3 integer, pct_0_3 numeric, pct_025_3 numeric, pct_05_3 numeric, pct_075_3 numeric, pct_1_3 numeric, athcnt_4 integer, actcnt_4 integer, cmtcnt_4 integer, pct_0_4 numeric, pct_025_4 numeric, pct_05_4 numeric, pct_075_4 numeric, pct_1_4 numeric, athcnt_5 integer, actcnt_5 integer, cmtcnt_5 integer, pct_0_5 numeric, pct_025_5 numeric, pct_05_5 numeric, pct_075_5 numeric, pct_1_5 numeric, athcnt_6 integer, actcnt_6 integer, cmtcnt_6 integer, pct_0_6 numeric, pct_025_6 numeric, pct_05_6 numeric, pct_075_6 numeric, pct_1_6 numeric, athcnt_7 integer, actcnt_7 integer, cmtcnt_7 integer, pct_0_7 numeric, pct_025_7 numeric, pct_05_7 numeric, pct_075_7 numeric, pct_1_7 numeric, athcnt integer, actcnt integer, cmtcnt integer, pct_0 numeric, pct_025 numeric, pct_05 numeric, pct_075 numeric, pct_1 numeric);"
    echo $CREATE_TBL
    COPY_TBL="\COPY $TBL FROM '$file' DELIMITERS ',' CSV HEADER;"
    echo $COPY_TBL
    TBL_IDX="CREATE INDEX $TBL_id_idx ON $TBL USING btree (node_id);"
    echo $TBL_IDX
done
