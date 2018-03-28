---
--- GIS tool friendly views
---

---
--- OD origin rollup - total
---

DROP MATERIALIZED VIEW IF EXISTS cos_od_origin_rollup_total;

CREATE MATERIALIZED VIEW IF NOT EXISTS cos_od_origin_rollup_total
AS SELECT * FROM cos_edges_od_polygons_hex AS h 
LEFT JOIN (
	SELECT '2017_01' AS rollup_date, * FROM ride_od_rollup_month_2017_1_total
	UNION ALL SELECT '2017_02' as rollup_date, * from ride_od_rollup_month_2017_2_total
	UNION ALL SELECT '2017_03' as rollup_date, * from ride_od_rollup_month_2017_3_total
	UNION ALL SELECT '2017_04' as rollup_date, * from ride_od_rollup_month_2017_4_total
	UNION ALL SELECT '2017_05' as rollup_date, * from ride_od_rollup_month_2017_5_total
	UNION ALL SELECT '2017_06' as rollup_date, * from ride_od_rollup_month_2017_6_total
	UNION ALL SELECT '2017_07' as rollup_date, * from ride_od_rollup_month_2017_7_total
	UNION ALL SELECT '2017_08' as rollup_date, * from ride_od_rollup_month_2017_8_total
	UNION ALL SELECT '2017_09' as rollup_date, * from ride_od_rollup_month_2017_9_total
	UNION ALL SELECT '2017_10' as rollup_date, * from ride_od_rollup_month_2017_10_total
	UNION ALL SELECT '2017_11' as rollup_date, * from ride_od_rollup_month_2017_11_total
	UNION ALL SELECT '2017_12' as rollup_date, * from ride_od_rollup_month_2017_12_total
) AS r ON r.origin = h.id;

---
--- OD destination rollup - total
---

DROP MATERIALIZED VIEW IF EXISTS cos_od_destination_rollup_total;

CREATE MATERIALIZED VIEW IF NOT EXISTS cos_od_destination_rollup_total
AS SELECT * FROM cos_edges_od_polygons_hex AS h 
LEFT JOIN (
	SELECT '2017_01' AS rollup_date, * FROM ride_od_rollup_month_2017_1_total
	UNION ALL SELECT '2017_02' as rollup_date, * from ride_od_rollup_month_2017_2_total
	UNION ALL SELECT '2017_03' as rollup_date, * from ride_od_rollup_month_2017_3_total
	UNION ALL SELECT '2017_04' as rollup_date, * from ride_od_rollup_month_2017_4_total
	UNION ALL SELECT '2017_05' as rollup_date, * from ride_od_rollup_month_2017_5_total
	UNION ALL SELECT '2017_06' as rollup_date, * from ride_od_rollup_month_2017_6_total
	UNION ALL SELECT '2017_07' as rollup_date, * from ride_od_rollup_month_2017_7_total
	UNION ALL SELECT '2017_08' as rollup_date, * from ride_od_rollup_month_2017_8_total
	UNION ALL SELECT '2017_09' as rollup_date, * from ride_od_rollup_month_2017_9_total
	UNION ALL SELECT '2017_10' as rollup_date, * from ride_od_rollup_month_2017_10_total
	UNION ALL SELECT '2017_11' as rollup_date, * from ride_od_rollup_month_2017_11_total
	UNION ALL SELECT '2017_12' as rollup_date, * from ride_od_rollup_month_2017_12_total
) AS r ON r.destination = h.id;

---
--- OD origin rollup - weekend
---

DROP MATERIALIZED VIEW IF EXISTS cos_od_origin_rollup_weekend;

CREATE MATERIALIZED VIEW IF NOT EXISTS cos_od_origin_rollup_weekend
AS SELECT * FROM cos_edges_od_polygons_hex AS h 
LEFT JOIN (
	SELECT '2017_01' AS rollup_date, * FROM ride_od_rollup_month_2017_1_weekend
	UNION ALL SELECT '2017_02' as rollup_date, * from ride_od_rollup_month_2017_2_weekend
	UNION ALL SELECT '2017_03' as rollup_date, * from ride_od_rollup_month_2017_3_weekend
	UNION ALL SELECT '2017_04' as rollup_date, * from ride_od_rollup_month_2017_4_weekend
	UNION ALL SELECT '2017_05' as rollup_date, * from ride_od_rollup_month_2017_5_weekend
	UNION ALL SELECT '2017_06' as rollup_date, * from ride_od_rollup_month_2017_6_weekend
	UNION ALL SELECT '2017_07' as rollup_date, * from ride_od_rollup_month_2017_7_weekend
	UNION ALL SELECT '2017_08' as rollup_date, * from ride_od_rollup_month_2017_8_weekend
	UNION ALL SELECT '2017_09' as rollup_date, * from ride_od_rollup_month_2017_9_weekend
	UNION ALL SELECT '2017_10' as rollup_date, * from ride_od_rollup_month_2017_10_weekend
	UNION ALL SELECT '2017_11' as rollup_date, * from ride_od_rollup_month_2017_11_weekend
	UNION ALL SELECT '2017_12' as rollup_date, * from ride_od_rollup_month_2017_12_weekend
) AS r ON r.origin = h.id;

---
--- OD destination rollup - weekend
---

DROP MATERIALIZED VIEW IF EXISTS cos_od_destination_rollup_weekend;

CREATE MATERIALIZED VIEW IF NOT EXISTS cos_od_destination_rollup_weekend
AS SELECT * FROM cos_edges_od_polygons_hex AS h 
LEFT JOIN (
	SELECT '2017_01' AS rollup_date, * FROM ride_od_rollup_month_2017_1_weekend
	UNION ALL SELECT '2017_02' as rollup_date, * from ride_od_rollup_month_2017_2_weekend
	UNION ALL SELECT '2017_03' as rollup_date, * from ride_od_rollup_month_2017_3_weekend
	UNION ALL SELECT '2017_04' as rollup_date, * from ride_od_rollup_month_2017_4_weekend
	UNION ALL SELECT '2017_05' as rollup_date, * from ride_od_rollup_month_2017_5_weekend
	UNION ALL SELECT '2017_06' as rollup_date, * from ride_od_rollup_month_2017_6_weekend
	UNION ALL SELECT '2017_07' as rollup_date, * from ride_od_rollup_month_2017_7_weekend
	UNION ALL SELECT '2017_08' as rollup_date, * from ride_od_rollup_month_2017_8_weekend
	UNION ALL SELECT '2017_09' as rollup_date, * from ride_od_rollup_month_2017_9_weekend
	UNION ALL SELECT '2017_10' as rollup_date, * from ride_od_rollup_month_2017_10_weekend
	UNION ALL SELECT '2017_11' as rollup_date, * from ride_od_rollup_month_2017_11_weekend
	UNION ALL SELECT '2017_12' as rollup_date, * from ride_od_rollup_month_2017_12_weekend
) AS r ON r.destination = h.id;


---
--- OD origin rollup - weekday
---

DROP MATERIALIZED VIEW IF EXISTS cos_od_origin_rollup_weekday;

CREATE MATERIALIZED VIEW IF NOT EXISTS cos_od_origin_rollup_weekday
AS SELECT * FROM cos_edges_od_polygons_hex AS h 
LEFT JOIN (
	SELECT '2017_01' AS rollup_date, * FROM ride_od_rollup_month_2017_1_weekday
	UNION ALL SELECT '2017_02' as rollup_date, * from ride_od_rollup_month_2017_2_weekday
	UNION ALL SELECT '2017_03' as rollup_date, * from ride_od_rollup_month_2017_3_weekday
	UNION ALL SELECT '2017_04' as rollup_date, * from ride_od_rollup_month_2017_4_weekday
	UNION ALL SELECT '2017_05' as rollup_date, * from ride_od_rollup_month_2017_5_weekday
	UNION ALL SELECT '2017_06' as rollup_date, * from ride_od_rollup_month_2017_6_weekday
	UNION ALL SELECT '2017_07' as rollup_date, * from ride_od_rollup_month_2017_7_weekday
	UNION ALL SELECT '2017_08' as rollup_date, * from ride_od_rollup_month_2017_8_weekday
	UNION ALL SELECT '2017_09' as rollup_date, * from ride_od_rollup_month_2017_9_weekday
	UNION ALL SELECT '2017_10' as rollup_date, * from ride_od_rollup_month_2017_10_weekday
	UNION ALL SELECT '2017_11' as rollup_date, * from ride_od_rollup_month_2017_11_weekday
	UNION ALL SELECT '2017_12' as rollup_date, * from ride_od_rollup_month_2017_12_weekday
) AS r ON r.origin = h.id;

---
--- OD destination rollup - weekday
---

DROP MATERIALIZED VIEW IF EXISTS cos_od_destination_rollup_weekday;

CREATE MATERIALIZED VIEW IF NOT EXISTS cos_od_destination_rollup_weekday
AS SELECT * FROM cos_edges_od_polygons_hex AS h 
LEFT JOIN (
	SELECT '2017_01' AS rollup_date, * FROM ride_od_rollup_month_2017_1_weekday
	UNION ALL SELECT '2017_02' as rollup_date, * from ride_od_rollup_month_2017_2_weekday
	UNION ALL SELECT '2017_03' as rollup_date, * from ride_od_rollup_month_2017_3_weekday
	UNION ALL SELECT '2017_04' as rollup_date, * from ride_od_rollup_month_2017_4_weekday
	UNION ALL SELECT '2017_05' as rollup_date, * from ride_od_rollup_month_2017_5_weekday
	UNION ALL SELECT '2017_06' as rollup_date, * from ride_od_rollup_month_2017_6_weekday
	UNION ALL SELECT '2017_07' as rollup_date, * from ride_od_rollup_month_2017_7_weekday
	UNION ALL SELECT '2017_08' as rollup_date, * from ride_od_rollup_month_2017_8_weekday
	UNION ALL SELECT '2017_09' as rollup_date, * from ride_od_rollup_month_2017_9_weekday
	UNION ALL SELECT '2017_10' as rollup_date, * from ride_od_rollup_month_2017_10_weekday
	UNION ALL SELECT '2017_11' as rollup_date, * from ride_od_rollup_month_2017_11_weekday
	UNION ALL SELECT '2017_12' as rollup_date, * from ride_od_rollup_month_2017_12_weekday
) AS r ON r.destination = h.id;
