#!/bin/bash
#
# Generates SQL import script for Edges CSV files
#
ST="co"
ID="co_201701_201712_"
#
echo "/* Generated on `date` */"
for file in $ID*.csv ; do
    [ -e "$file" ] || continue
    TBL=`echo "$ST_$file" | sed -e "s/$ID//" -e 's/.csv//'`
    DROP_TBL="DROP TABLE IF EXISTS $TBL;"
    echo $DROP_TBL
    CREATE_TBL="CREATE TABLE $TBL (edge_id integer, athcnt_0 integer, rathcnt_0 integer ,actcnt_0 integer, ractcnt_0 integer, tathcnt_0 integer, tactcnt_0 integer, acttime_0 numeric, racttime_0 numeric, cmtcnt_0 integer, rcmtcnt_0 integer, tcmtcnt_0 integer, athcnt_1 integer, rathcnt_1 integer, actcnt_1 integer, ractcnt_1 integer, tathcnt_1 integer, tactcnt_1 integer, acttime_1 numeric, racttime_1 numeric, cmtcnt_1 integer, rcmtcnt_1 integer, tcmtcnt_1 integer, athcnt_2 integer, rathcnt_2 integer, actcnt_2 integer, ractcnt_2 integer, tathcnt_2 integer, tactcnt_2 integer, acttime_2 numeric, racttime_2 numeric, cmtcnt_2 integer, rcmtcnt_2 integer, tcmtcnt_2 integer, athcnt_3 integer, rathcnt_3 integer, actcnt_3 integer, ractcnt_3 integer, tathcnt_3 integer, tactcnt_3 integer, acttime_3 numeric, racttime_3 numeric, cmtcnt_3 integer, rcmtcnt_3 integer, tcmtcnt_3 integer, athcnt_4 integer, rathcnt_4 integer, actcnt_4 integer, ractcnt_4 integer, tathcnt_4 integer, tactcnt_4 integer, acttime_4 numeric, racttime_4 numeric, cmtcnt_4 integer, rcmtcnt_4 integer, tcmtcnt_4 integer, athcnt_5 integer, rathcnt_5 integer, actcnt_5 integer, ractcnt_5 integer, tathcnt_5 integer, tactcnt_5 integer, acttime_5 numeric, racttime_5 numeric, cmtcnt_5 integer, rcmtcnt_5 integer, tcmtcnt_5 integer, athcnt_6 integer, rathcnt_6 integer, actcnt_6 integer, ractcnt_6 integer, tathcnt_6 integer, tactcnt_6 integer, acttime_6 numeric, racttime_6 numeric, cmtcnt_6 integer, rcmtcnt_6 integer, tcmtcnt_6 integer, athcnt_7 integer, rathcnt_7 integer, actcnt_7 integer, ractcnt_7 integer, tathcnt_7 integer, tactcnt_7 integer, acttime_7 numeric, racttime_7 numeric, cmtcnt_7 integer, rcmtcnt_7 integer, tcmtcnt_7 integer, athcnt integer, rathcnt integer, actcnt integer, ractcnt integer, tathcnt integer, tactcnt integer, acttime numeric, racttime numeric, cmtcnt integer, rcmtcnt integer, tcmtcnt integer);"
    echo $CREATE_TBL
    COPY_TBL="\COPY $TBL FROM '$file' DELIMITERS ',' CSV HEADER;"
    echo $COPY_TBL
    TBL_IDX="CREATE INDEX $TBL_id_idx ON $TBL USING btree (edge_id);"
    echo $TBL_IDX
done
