-- LOAD DATA INFILE 'C:/Users/garci/Documents/GitHub/pt1-hellcorp-LuisGarciaSTEM/CSV/PROCESADOS/contrato_limpio.csv'
-- INTO TABLE contratos
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n';

-- LOAD DATA INFILE 'C:/Users/garci/Documents/GitHub/pt1-hellcorp-LuisGarciaSTEM/CSV/PROCESADOS/demonios_limpio.csv'
-- INTO TABLE demonios
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS
-- (id_demonio, nombre_demonio, rango, especialidad, nivel_ira, siglo_servicio, activo);

-- LOAD DATA INFILE 'C:/Users/garci/Documents/GitHub/pt1-hellcorp-LuisGarciaSTEM/CSV/PROCESADOS/souls_limpio.csv'
-- INTO TABLE souls
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS
-- (id_alma, nombre, pecado_capital, nivel_corrupcion, fecha_condena, dimension_origen, estado);

-- LOAD DATA INFILE 'C:/Users/garci/Documents/GitHub/pt1-hellcorp-LuisGarciaSTEM/CSV/PROCESADOS/tormentos_limpio.csv'
-- INTO TABLE tormentos
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS
-- (id_tormento, id_alma, tipo_tormento, nivel_intensidad, duracion_horas, responsable_demonio, resultado_final);

