--how many stations per state
SELECT region,
COUNT(station_code) AS "num_of_stations"
--INTO stations_per_state
FROM water_data
GROUP BY region
ORDER BY COUNT(station_code) DESC;

--total water data
--ar is used instead of a due to a being a special character in SQL
SELECT wd.station_code,
ar.areas,
ar.region,
ar.lat,
ar.lng,
wd.tempurature,
wd.dis_oxy,
wd.ph,
wd.conduct,
wd.bod,
wd.nit,
wd.coli,
wd.total_coli,
gr.grade,
pot.potable
INTO total_water_data
FROM water_data AS wd
INNER JOIN area AS ar
ON (wd.station_code=ar.station_code)
INNER JOIN grade AS gr
ON (wd.station_code=gr.station_code)
INNER JOIN potability AS pot
ON (wd.station_code=pot.station_code);

--number of stations with potable water per state
SELECT twd.region,
COUNT(twd.potable) AS "num_stations_pot"
--INTO pot_stations_per_state
FROM total_water_data AS twd
WHERE (twd.potable = 1)
GROUP BY twd.region
ORDER BY COUNT(twd.potable) DESC;

--percentage of potable water by state
SELECT sps.region,
sps.num_of_stations,
psps.num_stations_pot,
CAST(psps.num_stations_pot AS FLOAT)/CAST(sps.num_of_stations AS FLOAT)*100 AS "percent potable"
--INTO percent_pot_state
FROM stations_per_state AS sps
INNER JOIN pot_stations_per_state as psps
ON (sps.region=psps.region)
ORDER BY CAST(psps.num_stations_pot AS FLOAT)/CAST(sps.num_of_stations AS FLOAT)*100 DESC;

--water stats with grade
SELECT wd.station_code,
wd.tempurature,
wd.dis_oxy,
wd.ph,
wd.conduct,
wd.bod,
wd.nit,
wd.coli,
wd.total_coli,
gr.grade
--INTO water_data_graded
FROM water_data AS wd
INNER JOIN grade AS gr
ON (wd.station_code=gr.station_code);

--water stats with grade, states(named region due to key word) added on
SELECT wd.station_code,
wd.region,
wd.tempurature,
wd.dis_oxy,
wd.ph,
wd.conduct,
wd.bod,
wd.nit,
wd.coli,
wd.total_coli,
gr.grade
--INTO water_data_graded_w_states
FROM water_data AS wd
INNER JOIN grade AS gr
ON (wd.station_code=gr.station_code);

--water stats with potability
SELECT wd.station_code,
wd.tempurature,
wd.dis_oxy,
wd.ph,
wd.conduct,
wd.bod,
wd.nit,
wd.coli,
wd.total_coli,
pot.potable
--INTO total_water_data
FROM water_data AS wd
INNER JOIN potability AS pot
ON (wd.station_code=pot.station_code);

--water stats with potability + states(named region due to key word)
SELECT wd.station_code,
wd.region,
wd.tempurature,
wd.dis_oxy,
wd.ph,
wd.conduct,
wd.bod,
wd.nit,
wd.coli,
wd.total_coli,
pot.potable
--INTO water_data_potable_w_states
FROM water_data AS wd
INNER JOIN potability AS pot
ON (wd.station_code=pot.station_code);