---
--- Indexes on rollup tables
---

--
-- 01 rollup
--
CREATE INDEX ride_od_rollup_month_2017_1_total_destination_idx ON ride_od_rollup_month_2017_1_total USING btree (destination);
CREATE INDEX ride_od_rollup_month_2017_1_weekday_destination_idx ON ride_od_rollup_month_2017_1_weekday USING btree (destination);
CREATE INDEX ride_od_rollup_month_2017_1_weekend_destination_idx ON ride_od_rollup_month_2017_1_weekend USING btree (destination);

--
-- 02 rollup
--
CREATE INDEX ride_od_rollup_month_2017_2_total_destination_idx ON ride_od_rollup_month_2017_2_total USING btree (destination);
CREATE INDEX ride_od_rollup_month_2017_2_weekday_destination_idx ON ride_od_rollup_month_2017_2_weekday USING btree (destination);
CREATE INDEX ride_od_rollup_month_2017_2_weekend_destination_idx ON ride_od_rollup_month_2017_2_weekend USING btree (destination);

--
-- 03 rollup
--
CREATE INDEX ride_od_rollup_month_2017_3_total_destination_idx ON ride_od_rollup_month_2017_3_total USING btree (destination);
CREATE INDEX ride_od_rollup_month_2017_3_weekday_destination_idx ON ride_od_rollup_month_2017_3_weekday USING btree (destination);
CREATE INDEX ride_od_rollup_month_2017_3_weekend_destination_idx ON ride_od_rollup_month_2017_3_weekend USING btree (destination);

--
-- 04 rollup
--
CREATE INDEX ride_od_rollup_month_2017_4_total_destination_idx ON ride_od_rollup_month_2017_4_total USING btree (destination);
CREATE INDEX ride_od_rollup_month_2017_4_weekday_destination_idx ON ride_od_rollup_month_2017_4_weekday USING btree (destination);
CREATE INDEX ride_od_rollup_month_2017_4_weekend_destination_idx ON ride_od_rollup_month_2017_4_weekend USING btree (destination);

--
-- 05 rollup
--
CREATE INDEX ride_od_rollup_month_2017_5_total_destination_idx ON ride_od_rollup_month_2017_5_total USING btree (destination);
CREATE INDEX ride_od_rollup_month_2017_5_weekday_destination_idx ON ride_od_rollup_month_2017_5_weekday USING btree (destination);
CREATE INDEX ride_od_rollup_month_2017_5_weekend_destination_idx ON ride_od_rollup_month_2017_5_weekend USING btree (destination);

--
-- 06 rollup
--
CREATE INDEX ride_od_rollup_month_2017_6_total_destination_idx ON ride_od_rollup_month_2017_6_total USING btree (destination);
CREATE INDEX ride_od_rollup_month_2017_6_weekday_destination_idx ON ride_od_rollup_month_2017_6_weekday USING btree (destination);
CREATE INDEX ride_od_rollup_month_2017_6_weekend_destination_idx ON ride_od_rollup_month_2017_6_weekend USING btree (destination);

--
-- 07 rollup
--
CREATE INDEX ride_od_rollup_month_2017_7_total_destination_idx ON ride_od_rollup_month_2017_7_total USING btree (destination);
CREATE INDEX ride_od_rollup_month_2017_7_weekday_destination_idx ON ride_od_rollup_month_2017_7_weekday USING btree (destination);
CREATE INDEX ride_od_rollup_month_2017_7_weekend_destination_idx ON ride_od_rollup_month_2017_7_weekend USING btree (destination);

--
-- 08 rollup
--
CREATE INDEX ride_od_rollup_month_2017_8_total_destination_idx ON ride_od_rollup_month_2017_8_total USING btree (destination);
CREATE INDEX ride_od_rollup_month_2017_8_weekday_destination_idx ON ride_od_rollup_month_2017_8_weekday USING btree (destination);
CREATE INDEX ride_od_rollup_month_2017_8_weekend_destination_idx ON ride_od_rollup_month_2017_8_weekend USING btree (destination);

--
-- 09 rollup
--
CREATE INDEX ride_od_rollup_month_2017_9_total_destination_idx ON ride_od_rollup_month_2017_9_total USING btree (destination);
CREATE INDEX ride_od_rollup_month_2017_9_weekday_destination_idx ON ride_od_rollup_month_2017_9_weekday USING btree (destination);
CREATE INDEX ride_od_rollup_month_2017_9_weekend_destination_idx ON ride_od_rollup_month_2017_9_weekend USING btree (destination);

--
-- 10 rollup
--
CREATE INDEX ride_od_rollup_month_2017_10_total_destination_idx ON ride_od_rollup_month_2017_10_total USING btree (destination);
CREATE INDEX ride_od_rollup_month_2017_10_weekday_destination_idx ON ride_od_rollup_month_2017_10_weekday USING btree (destination);
CREATE INDEX ride_od_rollup_month_2017_10_weekend_destination_idx ON ride_od_rollup_month_2017_10_weekend USING btree (destination);

--
-- 11 rollup
--
CREATE INDEX ride_od_rollup_month_2017_11_total_destination_idx ON ride_od_rollup_month_2017_11_total USING btree (destination);
CREATE INDEX ride_od_rollup_month_2017_11_weekday_destination_idx ON ride_od_rollup_month_2017_11_weekday USING btree (destination);
CREATE INDEX ride_od_rollup_month_2017_11_weekend_destination_idx ON ride_od_rollup_month_2017_11_weekend USING btree (destination);

--
-- 12 rollup
--
CREATE INDEX ride_od_rollup_month_2017_12_total_destination_idx ON ride_od_rollup_month_2017_12_total USING btree (destination);
CREATE INDEX ride_od_rollup_month_2017_12_weekday_destination_idx ON ride_od_rollup_month_2017_12_weekday USING btree (destination);
CREATE INDEX ride_od_rollup_month_2017_12_weekend_destination_idx ON ride_od_rollup_month_2017_12_weekend USING btree (destination);
