#!/bin/bash
#
# Generates SQL import script for OD CSV files
#
ST="co"
ID="co_201701_201712_"
#
echo "/* Generated on `date` */"
for file in $ID*.csv; do
    [ -e "$file" ] || continue
    TBL=`echo "$ST_$file" | sed -e "s/$ID//" -e 's/.csv//'`
    DROP_TBL="DROP TABLE IF EXISTS $TBL;"
    echo $DROP_TBL
    CREATE_TBL="CREATE TABLE $TBL (origin integer, destination integer, athcnt_0 integer, actcnt_0 integer, cmtcnt_0 integer, athcnt_1 integer, actcnt_1 integer, cmtcnt_1 integer, athcnt_2 integer, actcnt_2 integer, cmtcnt_2 integer, athcnt_3 integer, actcnt_3 integer, cmtcnt_3 integer, athcnt_4 integer, actcnt_4 integer, cmtcnt_4 integer, athcnt_5 integer, actcnt_5 integer, cmtcnt_5 integer, athcnt_6 integer, actcnt_6 integer, cmtcnt_6 integer, athcnt_7 integer, actcnt_7 integer, cmtcnt_7 integer, athcnt integer, actcnt integer, cmtcnt integer);"
    echo $CREATE_TBL
    COPY_TBL="\COPY $TBL FROM '$file' DELIMITERS ',' CSV HEADER;"
    echo $COPY_TBL
    TBL_IDX1="CREATE INDEX $TBL_origin_idx ON $TBL USING btree (origin);"
    echo $TBL_IDX1
    TBL_IDX2="CREATE INDEX $TBL_destination_idx ON $TBL USING btree (destination);"
    echo $TBL_IDX1
done
